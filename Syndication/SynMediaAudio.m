//
//  SynMediaAudio.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaAudio.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaAudio

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];

    // Future SynMediaAudio specific members here
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaAudio class]
                                         representation:representation];
    
    // Future SynMediaAudio mapping here
    
    return mediaMapping;
}

@end
