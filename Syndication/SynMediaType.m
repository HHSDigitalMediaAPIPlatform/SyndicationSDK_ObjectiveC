//
//  SynMediaType.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaType.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaType

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];

    SYNOUTPUT_DICTIONARY(@"name", self.mediaTypeName);
    SYNOUTPUT_DICTIONARY(@"description", self.mediaTypeDescription);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaTypeMapping = [RKObjectMapping mappingForClass:[SynMediaType class]];
    [mediaTypeMapping addAttributeMappingsFromDictionary:@{
                                                           @"name": @"mediaTypeName",
                                                           @"description": @"mediaTypeDescription",
                                                           }];

    return mediaTypeMapping;
}

@end