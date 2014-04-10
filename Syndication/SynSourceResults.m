//
//  SynSourceResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "SynSourceResults.h"
#import "SynSource.h"
#import "RestKit.h"

@implementation SynSourceResults

#pragma mark - init/dealloc

+ (SynSourceResults *) sourceResults
{
    return (SynSourceResults *)[super resultsWithMapping:@{ @"mapping": [SynSource mapping] }];
}

#pragma mark - methods

- (void) getSourcesWithOptions:(NSDictionary *)options
                       success:(void (^)(SynSourceResults *sourceResults))success
                       failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/sources.json"
                                         parameters:parameters
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

- (void) getSourceById:(NSUInteger)sourceId
               success:(void (^)(SynSourceResults *sourceResults))success
               failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/sources/%lu.json", (unsigned long)sourceId]
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

@end
