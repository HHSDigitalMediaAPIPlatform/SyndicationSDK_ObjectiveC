//
//  SynMediaRatingResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaRatingResults.h"
#import "SynMediaRating.h"
#import "RestKit.h"
#import "RKMappingErrors.h"

@implementation SynMediaRatingResults

#pragma mark - init/dealloc

+ (SynMediaRatingResults *) ratingResults
{
    return (SynMediaRatingResults *)[super resultsWithMapping:@{ @"mapping": [SynMediaRating mapping] }];
}

#pragma mark - methods

- (void) getMediaRatingByMediaId:(NSUInteger)mediaId
                         success:(void (^)(NSNumber *ratingLikes))success
                         failure:(void (^)(NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/media/%lu/ratings.json", (unsigned long)mediaId]
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                _results = mappingResult;
                                                SynMediaRating *embedObject = [[self resultsObjects] objectAtIndex:0];
                                                if (embedObject) {
                                                    success([embedObject ratingLikes]);
                                                } else {
                                                    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: @"Could not decode rating likes from response." };
                                                    failure([NSError errorWithDomain:RKErrorDomain code:RKMappingErrorNotFound userInfo:userInfo]);
                                                }
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                _results = nil;
                                                failure(error);
                                            }
     ];
}

@end
