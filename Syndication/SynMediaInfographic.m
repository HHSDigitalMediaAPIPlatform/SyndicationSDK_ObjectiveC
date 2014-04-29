//
//  SynMediaInfographic.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaInfographic.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaInfographic

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    // Future SynMediaInfographic specific members here
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaInfographic class]
                                         representation:representation];
    
    // Future SynMediaInfographic mapping here
    
    return mediaMapping;
}

@end
