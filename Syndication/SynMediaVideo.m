//
//  SynMediaVideo.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaVideo.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaVideo

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    SYNOUTPUT_DICTIONARY(@"youtubeMetaData", self.mediaYoutubeMetaData);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaVideo class]
                                         representation:representation];
    [mediaMapping addAttributeMappingsFromDictionary:@{
                                                       @"youtubeMetaData": @"mediaYoutubeMetaData",
                                                       }];
    return mediaMapping;
}

@end
