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

+ (SynResults *) resultsWithMapping:(NSDictionary *)mappingOptions
{
    SynResults *results = [[self alloc] init];

    RKObjectMapping *paginationMapping;
    RKResponseDescriptor *paginationResponseDescriptor;
    
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
    
    paginationMapping = [RKObjectMapping mappingForClass:[SynPagination class]];
    [paginationMapping addAttributeMappingsFromDictionary:@{
                                                            @"count": @"count",
                                                            @"max": @"max",
                                                            @"offset": @"offset",
                                                            @"order": @"order",
                                                            @"pageNum": @"pageNum",
                                                            @"sort": @"sort",
                                                            @"total": @"total",
                                                            @"totalPages": @"totalPages"
                                                            }];
    
    paginationResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:paginationMapping
                                                                                method:RKRequestMethodGET
                                                                           pathPattern:nil
                                                                               keyPath:@"meta.pagination"
                                                                           statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    
    [RKObjectManager.sharedManager addResponseDescriptor:paginationResponseDescriptor];

    return results;
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

@end
