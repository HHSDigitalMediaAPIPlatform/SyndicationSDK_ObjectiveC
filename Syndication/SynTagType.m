//
//  SynTagType.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynTagType.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynTagType

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.tagTypeId);
    SYNOUTPUT_DICTIONARY(@"name", self.tagTypeName);
    SYNOUTPUT_DICTIONARY(@"description", self.tagTypeDescription);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *tagMapping = [RKObjectMapping mappingForClass:[SynTagType class]];
    [tagMapping addAttributeMappingsFromDictionary:@{
                                                     @"id": @"tagTypeId",
                                                     @"name": @"tagTypeName",
                                                     @"description": @"tagTypeDescription",
                                                     }];
    return tagMapping;
}

@end
