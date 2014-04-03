//
//  SynCampaign.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynCampaign.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynCampaign

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.campaignId);
    SYNOUTPUT_DICTIONARY(@"name", self.campaignName);
    SYNOUTPUT_DICTIONARY(@"description", self.campaignDescription);
    SYNOUTPUT_DICTIONARY(@"startDate", self.campaignStartDate);
    SYNOUTPUT_DICTIONARY(@"endDate", self.campaignEndDate);
    SYNOUTPUT_DICTIONARY(@"campaignSource", self.campaignSource);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *campaignMapping = [RKObjectMapping mappingForClass:[SynCampaign class]];
    [campaignMapping addAttributeMappingsFromDictionary:@{
                                                          @"id": @"campaignId",
                                                          @"name": @"campaignName",
                                                          @"description": @"campaignDescription",
                                                          @"startDate": @"campaignStartDate",
                                                          @"endDate": @"campaignEndDate",
                                                          @"source": @"campaignSource",
                                                          
                                                          }];
    return campaignMapping;
}

@end
