//
//  SynMediaEmbed.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaEmbed.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaEmbed

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"snippet", self.embedSnippet);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaEmbedMapping = [RKObjectMapping mappingForClass:[SynMediaEmbed class]];
    [mediaEmbedMapping addAttributeMappingsFromDictionary:@{
                                                            @"snippet": @"embedSnippet",
                                                            }];
    return mediaEmbedMapping;
}

@end
