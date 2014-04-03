//
//  SynSource.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynSource.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynSource

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.sourceId);
    SYNOUTPUT_DICTIONARY(@"name", self.sourceName);
    SYNOUTPUT_DICTIONARY(@"acronym", self.sourceAcronym);
    SYNOUTPUT_DICTIONARY(@"websiteUrl", self.sourceWebsiteUrl);
    SYNOUTPUT_DICTIONARY(@"largeLogoUrl", self.sourceLargeLogoUrl);
    SYNOUTPUT_DICTIONARY(@"smallLogoUrl", self.sourceSmallLogoUrl);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *sourceMapping = [RKObjectMapping mappingForClass:[SynSource class]];
    [sourceMapping addAttributeMappingsFromDictionary:@{
                                                        @"id": @"sourceId",
                                                        @"name": @"sourceName",
                                                        @"acronym": @"sourceAcronym",
                                                        @"websiteUrl": @"sourceWebsiteUrl",
                                                        @"largeLogoUrl": @"sourceLargeLogoUrl",
                                                        @"smallLogoUrl": @"sourceSmallLogoUrl",
                                                        
                                                        }];
    return sourceMapping;
}

@end
