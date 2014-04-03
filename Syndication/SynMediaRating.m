//
//  SynMediaRating.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaRating.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaRating

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"likes", self.ratingLikes);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaRatingMapping = [RKObjectMapping mappingForClass:[SynMediaRating class]];
    [mediaRatingMapping addAttributeMappingsFromDictionary:@{
                                                             @"likes": @"ratingLikes",
                                                             }];
    return mediaRatingMapping;
}

@end
