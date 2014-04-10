//
//  SynMediaAlternateImageResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaAlternateImageResults.h"
#import "SynMediaAlternateImage.h"
#import "RestKit.h"

@implementation SynMediaAlternateImageResults

#pragma mark - init/dealloc

+ (SynMediaAlternateImageResults *) alternateImageResults
{
    return (SynMediaAlternateImageResults *)[super resultsWithMapping:@{ @"mapping": [SynMediaAlternateImage mapping] }];
}

#pragma mark - methods

- (void) getMediaAlternateImagesByMediaId:(NSUInteger)mediaId
                                  success:(void (^)(SynMediaAlternateImageResults *alternateImageResults))success
                                  failure:(void (^)(SynMediaAlternateImageResults *alternateImageResults, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/media/%lu/alternateImages.json", (unsigned long)mediaId]
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
