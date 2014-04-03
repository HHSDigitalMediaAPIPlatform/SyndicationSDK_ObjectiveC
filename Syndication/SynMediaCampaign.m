//
//  SynMediaCampaign.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaCampaign.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaCampaign

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.campaignId);
    SYNOUTPUT_DICTIONARY(@"name", self.campaignName);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaCampaignMapping = [RKObjectMapping mappingForClass:[SynMediaCampaign class]];
    [mediaCampaignMapping addAttributeMappingsFromDictionary:@{
                                                          @"id": @"campaignId",
                                                          @"name": @"campaignName",
                                                          }];
    return mediaCampaignMapping;
}

@end
