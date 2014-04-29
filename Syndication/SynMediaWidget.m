//
//  SynMediaWidget.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaWidget.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaWidget

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    // Future SynMediaWidget specific members here
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaWidget class]
                                         representation:representation];
    
    // Future SynMediaWidget mapping here
    
    return mediaMapping;
}

@end
