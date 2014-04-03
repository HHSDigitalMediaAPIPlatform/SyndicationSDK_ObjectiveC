//
//  SynMediaTypeResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"
#import "SynMediaTypeResults.h"
#import "RestKit.h"
#import "SynMediaType.h"

@implementation SynMediaTypeResults

#pragma mark - init/dealloc

+ (SynMediaTypeResults *) mediaTypeResults
{
    return (SynMediaTypeResults *)[super resultsWithMapping:@{ @"mapping": [SynMediaType mapping] }];
}

#pragma mark - methods

- (void) getMediaTypes:(void (^)(SynMediaTypeResults *mediaTypes))success
               failure:(void (^)(SynMediaTypeResults *mediaTypes, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/mediaTypes.json"
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                _results = mappingResult;
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                _results = nil;
                                                failure(self, error);
                                            }
     ];
}

@end