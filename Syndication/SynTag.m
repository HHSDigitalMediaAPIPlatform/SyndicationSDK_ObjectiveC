//
//  SynTag.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynTag.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynTag

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.tagId);
    SYNOUTPUT_DICTIONARY(@"name", self.tagName);
    SYNOUTPUT_DICTIONARY(@"language", self.tagLanguage);
    SYNOUTPUT_DICTIONARY(@"type", self.tagType);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *tagMapping = [RKObjectMapping mappingForClass:[SynTag class]];
    [tagMapping addAttributeMappingsFromDictionary:@{
                                                        @"id": @"tagId",
                                                        @"name": @"tagName",
                                                        @"language": @"tagLanguage",
                                                        @"type": @"tagType",
                                                        }];
    return tagMapping;
}

@end
