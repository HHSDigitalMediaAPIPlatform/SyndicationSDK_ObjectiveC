//
//  SynMediaHTML.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaHTML.h"

@implementation SynMediaHTML

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    // Future SynMediaHTML specific members here
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaHTML class]
                                         representation:representation];
    
    // Future SynMediaHTML mapping here
    
    return mediaMapping;
}

@end