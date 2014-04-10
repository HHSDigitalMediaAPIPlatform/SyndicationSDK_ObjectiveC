//
//  SynMediaResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "NSString+Equality.h"
#import "SynMediaResults.h"
#import "RestKit.h"

#import "SynMediaHTML.h"
#import "SynMediaImage.h"
#import "SynMediaVideo.h"

@implementation SynMediaResults

#pragma mark - init/dealloc

+ (SynMediaResults *) mediaResults
{
    RKDynamicMapping *dynamicMapping = [RKDynamicMapping new];
    RKResponseDescriptor *resultsResponseDescriptor;
    
    // Our dynamic mapping based on mediaType
    [dynamicMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation) {
        if ([[representation valueForKey:@"mediaType"] isEqualIgnoringCase:@"Html"]) {
            return [SynMediaHTML mapping];
        } else if ([[representation valueForKey:@"mediaType"] isEqualIgnoringCase:@"Image"]) {
            return [SynMediaImage mapping];
        } else if ([[representation valueForKey:@"mediaType"] isEqualIgnoringCase:@"Video"]) {
            return [SynMediaVideo mapping];
        }
        return nil;
    }];
    
    resultsResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dynamicMapping
                                                                             method:RKRequestMethodGET
                                                                        pathPattern:nil
                                                                            keyPath:@"results"
                                                                        statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    return (SynMediaResults *)[super resultsWithMapping:@{ @"results": resultsResponseDescriptor }];
}

#pragma mark - methods

- (void) getMediaWithOptions:(NSDictionary *)options
                     success:(void (^)(SynMediaResults *mediaResults))success
                     failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  @"mediaType",
                                                                                  @"name",
                                                                                  @"nameContains",
                                                                                  @"descriptionContains",
                                                                                  @"sourceUrl",
                                                                                  @"sourceUrlContains",
                                                                                  @"dateContentAuthored",
                                                                                  @"contentAuthoredSinceDate",
                                                                                  @"contentAuthoredBeforeDate",
                                                                                  @"contentAuthoredInRange",
                                                                                  @"dateContentUpdated",
                                                                                  @"contentUpdatedSinceDate",
                                                                                  @"contentUpdatedBeforeDate",
                                                                                  @"contentUpdatededInRange",
                                                                                  @"dateContentPublished",
                                                                                  @"contentPublishedSinceDate",
                                                                                  @"contentPublishedBeforeDate",
                                                                                  @"contentPublishedInRange",
                                                                                  @"dateContentReviewed",
                                                                                  @"contentReviewedSinceDate",
                                                                                  @"contentReviewedBeforeDate",
                                                                                  @"contentReviewedInRange",
                                                                                  @"dateSyndicationCaptured",
                                                                                  @"syndicationCapturedSinceDate",
                                                                                  @"syndicationCapturedBeforeDate",
                                                                                  @"syndicationCapturedInRange",
                                                                                  @"dateSyndicationUpdated",
                                                                                  @"syndicationUpdatedSinceDate",
                                                                                  @"syndicationUpdatedBeforeDate",
                                                                                  @"syndicationUpdatedInRange",
                                                                                  @"dateSyndicationVisible",
                                                                                  @"syndicationVisibleSinceDate",
                                                                                  @"syndicationVisibleBeforeDate",
                                                                                  @"syndicationVisibleInRange",
                                                                                  @"languageId",
                                                                                  @"languageName",
                                                                                  @"languageIsoCode",
                                                                                  @"hash",
                                                                                  @"hashContains",
                                                                                  @"sourceId",
                                                                                  @"sourceName",
                                                                                  @"sourceNameContains",
                                                                                  @"sourceAcronym",
                                                                                  @"sourceAcronymContains",
                                                                                  @"tagIds",
                                                                                  @"restrictToSet",
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/media.json"
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

- (void) getMediaRelatedToMediaId:(NSUInteger)mediaId
                          options:(NSDictionary *)options
                            success:(void (^)(SynMediaResults *mediaResults))success
                            failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/media/%lu/relatedMedia.json", (unsigned long)mediaId]
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

- (void) getMediaPopularWithOptions:(NSDictionary *)options
                            success:(void (^)(SynMediaResults *mediaResults))success
                            failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/media/mostPopularMedia.json"
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

- (void) getMediaByCampaignId:(NSUInteger)campaignId
                      options:(NSDictionary *)options
                      success:(void (^)(SynMediaResults *mediaResults))success
                      failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/campaigns/%lu/media.json", (unsigned long)campaignId]
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

- (void) getMediaById:(NSUInteger)mediaId
              success:(void (^)(SynMediaResults *mediaResults))success
              failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/media/%lu.json", (unsigned long)mediaId]
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

- (void) searchMedia:(NSString *)searchString
             options:(NSDictionary *)options
             success:(void (^)(SynMediaResults *mediaResults))success
             failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    NSMutableDictionary *parameters = [[self optionsToParameters:options acceptableKeys:@[
                                                                                          SYN_OFFSET,
                                                                                          SYN_MAX,
                                                                                          SYN_SORT,
                                                                                          ]] mutableCopy];

    [parameters setObject:searchString forKey:@"q"];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/media/searchResults.json"
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

@end
