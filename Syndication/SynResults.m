//
//  SynResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynErrors.h"
#import "SynResults.h"
#import "RestKit.h"
#import "Syndication.h"
#import "SynMetaData.h"

@implementation SynResults

#pragma mark - init/dealloc

+ (SynResults *) resultsWithMapping:(NSDictionary *)mappingOptions
{
    SynResults *results = [self new];

    if ([mappingOptions objectForKey:@"results"]) {
        [RKObjectManager.sharedManager addResponseDescriptor:[mappingOptions objectForKey:@"results"]];
    } else if ([mappingOptions objectForKey:@"mapping"]) {
        [RKObjectManager.sharedManager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[mappingOptions objectForKey:@"mapping"]
                                                                                                          method:RKRequestMethodGET
                                                                                                     pathPattern:nil
                                                                                                         keyPath:@"results"
                                                                                                     statusCodes:[NSIndexSet indexSetWithIndex:200]]];
    } else {
        // This will be a fatal error (no mapping associated!)
    }
    
    [RKObjectManager.sharedManager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[SynPagination mapping]
                                                                                                      method:RKRequestMethodGET
                                                                                                 pathPattern:nil
                                                                                                     keyPath:@"meta.pagination"
                                                                                                 statusCodes:[NSIndexSet indexSetWithIndex:200]]];

    [RKObjectManager.sharedManager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[SynMetaData mapping]
                                                                                                      method:RKRequestMethodGET
                                                                                                 pathPattern:nil
                                                                                                     keyPath:@"meta"
                                                                                                 statusCodes:[NSIndexSet indexSetWithIndex:200]]];
    return results;
}

- (void) handleResults:(RKMappingResult *)results
                append:(BOOL)append
{

    if (!results) {
        _resultsArray = nil;
        _resultsObjectsArray = nil;
        return;
    }
    
    // When a request comes in, we need to process it into both an array of
    // dictionaries as well as an array of objects.  Also handle pagination
    // (making sure our result set is appended to when loading more)
    
    NSArray *resultsArray = [[results dictionary] objectForKey:@"results"];
    
    NSMutableArray *outDictionaryArray = [NSMutableArray array];
    NSMutableArray *outObjectsArray = [NSMutableArray array];
    for (int i = 0; i < [resultsArray count]; i++) {
        [outObjectsArray addObject:resultsArray[i]];
        [outDictionaryArray addObject:[resultsArray[i] dictionary]];
    }
    
    if (!append) {
        _resultsArray = [NSMutableArray array];
        _resultsObjectsArray = [NSMutableArray array];
    }

    [_resultsArray addObjectsFromArray:outDictionaryArray];
    [_resultsObjectsArray addObjectsFromArray:outObjectsArray];
    
    // And our pagination data
    _paginationDictionary = [[[results dictionary] objectForKey:@"meta.pagination"] dictionary];
    _paginationObject = [[results dictionary] objectForKey:@"meta.pagination"];
    
    // And our Meta Data
    _metaDataDictionary = [[[results dictionary] objectForKey:@"meta"] dictionary];
}

- (void) handleResults:(RKMappingResult *)results
{
    [self handleResults:results append:NO];
}

- (NSArray *) results
{
    return _resultsArray;
}

- (NSArray *) resultsObjects
{
    return _resultsObjectsArray;
}

- (NSUInteger) count
{
    return [_resultsObjectsArray count];
}

- (NSUInteger) total
{
    if (!_paginationObject) {
        return 0;
    }
    
    return [_paginationObject.total intValue];
}

- (NSDictionary *) pagination
{
    return _paginationDictionary;
}

- (SynPagination *) paginationObject
{
    return _paginationObject;
}

- (NSNumber *) resultsStatus
{
    return [_metaDataDictionary objectForKey:@"status"];
}

- (NSString *) resultsMessages
{
    return [_metaDataDictionary objectForKey:@"messages"];
}

- (NSDictionary *) optionsToParameters:(NSDictionary *)options acceptableKeys:(NSArray *)acceptableKeys
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    if (options) {
        for (NSString *key in acceptableKeys) {
            if ([options objectForKey:key]) {
                [parameters setObject:[options objectForKey:key] forKey:key];
            }
        }
    }
    
    return parameters;
}

- (void) loadMore:(void (^)(SynResults *results))success
          failure:(void (^)(SynResults *results, NSError *error))failure
{
    if (!_results) {
        NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: @"No result set to request more results from." };
        failure(self, [NSError errorWithDomain:SynErrorDomain code:SynGeneralError userInfo:userInfo]);
    }
    
    if (![self paginationObject]) {
        NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: @"No pagination object to request more results with." };
        failure(self, [NSError errorWithDomain:SynErrorDomain code:SynGeneralError userInfo:userInfo]);
    }

    [RKObjectManager.sharedManager getObjectsAtPath:[self paginationObject].nextUrl
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult append:YES];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

- (BOOL) hasMore
{
    if (!_paginationObject) {
        return NO;
    }

    return ([_paginationObject.pageNum intValue] < [_paginationObject.totalPages intValue]);
}

@end
