//
//  SynResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"
#import "RestKit.h"
#import "Syndication.h"

@implementation SynResults

#pragma mark - init/dealloc

RKObjectMapping *_resultsMapping;
RKObjectMapping *_paginationMapping;
RKResponseDescriptor *_resultsResponseDescriptor;
RKResponseDescriptor *_paginationResponseDescriptor;

- (id) initWithMapping:(NSDictionary *)mappingOptions
{
    if (self = [super init]) {
        _resultsMapping = [RKObjectMapping mappingForClass:[mappingOptions objectForKey:@"class"]];
        [_resultsMapping addAttributeMappingsFromDictionary:[mappingOptions objectForKey:@"mapping"]];
        
        _resultsResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:_resultsMapping
                                                                                  method:RKRequestMethodGET
                                                                             pathPattern:nil
                                                                                 keyPath:@"results"
                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        [RKObjectManager.sharedManager addResponseDescriptor:_resultsResponseDescriptor];
        
        
        _paginationMapping = [RKObjectMapping mappingForClass:[SynPagination class]];
        [_paginationMapping addAttributeMappingsFromDictionary:@{
                                                                 @"count": @"count",
                                                                 @"max": @"max",
                                                                 @"offset": @"offset",
                                                                 @"order": @"order",
                                                                 @"pageNum": @"pageNum",
                                                                 @"sort": @"sort",
                                                                 @"total": @"total",
                                                                 @"totalPages": @"totalPages"
                                                                 }];
        
        _paginationResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:_paginationMapping
                                                                                     method:RKRequestMethodGET
                                                                                pathPattern:nil
                                                                                    keyPath:@"meta.pagination"
                                                                                statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        
        [RKObjectManager.sharedManager addResponseDescriptor:_paginationResponseDescriptor];
    }
    
    return self;
}

- (NSArray *) results
{
    NSArray *resultsArray = [[_results dictionary] objectForKey:@"results"];
    NSMutableArray *outArray = [NSMutableArray array];
    for (int i = 0; i < [resultsArray count]; i++) {
        [outArray addObject:[[resultsArray objectAtIndex:i] dictionary]];
    }
    return outArray;
}

- (NSArray *) resultsObjects
{
    NSArray *resultsArray = [[_results dictionary] objectForKey:@"results"];
    NSMutableArray *outArray = [NSMutableArray array];
    for (int i = 0; i < [resultsArray count]; i++) {
        [outArray addObject:[resultsArray objectAtIndex:i]];
    }
    return outArray;
}

- (NSDictionary *) pagination
{
    return [[[_results dictionary] objectForKey:@"meta.pagination"] dictionary];
}

- (SynPagination *) paginationObject
{
    return [[_results dictionary] objectForKey:@"meta.pagination"];
}

- (NSDictionary *) optionsToParameters:(NSDictionary *)options
{
    NSArray *acceptableKeys = @[
                                SYN_OFFSET,
                                SYN_MAX,
                                SYN_SORT,
                                @"id"
                                ];
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

@end
