//
//  SynMediaSocialMedia.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaSocialMedia.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaSocialMedia

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    // Future SynMediaSocialMedia specific members here
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaSocialMedia class]];
    
    // Future SynMediaSocialMedia mapping here
    
    return mediaMapping;
}

@end
