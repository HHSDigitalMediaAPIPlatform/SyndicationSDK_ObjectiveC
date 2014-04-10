//
//  SynCampaignResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "SynCampaignResults.h"
#import "SynCampaign.h"
#import "RestKit.h"

@implementation SynCampaignResults

#pragma mark - init/dealloc

+ (SynCampaignResults *) campaignResults
{
    return (SynCampaignResults *)[super resultsWithMapping:@{ @"mapping": [SynCampaign mapping] }];
}

#pragma mark - methods

- (void) getCampaignsWithOptions:(NSDictionary *)options
                         success:(void (^)(SynCampaignResults *campaignResults))success
                         failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/campaigns.json"
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

- (void) getCampaignById:(NSUInteger)campaignId
                 success:(void (^)(SynCampaignResults *mediaResults))success
                 failure:(void (^)(SynCampaignResults *mediaResults, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/campaigns/%lu.json", (unsigned long)campaignId]
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
