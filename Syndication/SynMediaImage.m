//
//  SynMediaImage.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaImage.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaImage

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    
    SYNOUTPUT_DICTIONARY(@"mediaWidth", self.mediaWidth);
    SYNOUTPUT_DICTIONARY(@"mediaHeight", self.mediaHeight);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaImage class]];
    [mediaMapping addAttributeMappingsFromDictionary:@{
                                                       @"width": @"mediaWidth",
                                                       @"height": @"mediaHeight",
                                                       }];
    return mediaMapping;
}

@end
