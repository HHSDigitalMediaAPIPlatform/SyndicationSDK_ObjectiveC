//
//  SynLanguage.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynLanguage.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynLanguage

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];

    SYNOUTPUT_DICTIONARY(@"id", self.languageId);
    SYNOUTPUT_DICTIONARY(@"name", self.languageName);
    SYNOUTPUT_DICTIONARY(@"isoCode", self.languageIsoCode);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *languageMapping = [RKObjectMapping mappingForClass:[SynLanguage class]];
    [languageMapping addAttributeMappingsFromDictionary:@{
                                                          @"id": @"languageId",
                                                          @"name": @"languageName",
                                                          @"isoCode": @"languageIsoCode",
                                                          }];
    return languageMapping;
}

@end
