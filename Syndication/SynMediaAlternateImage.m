//
//  SynMediaAlternateImage.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaAlternateImage.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaAlternateImage

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"id", self.alternateImageId);
    SYNOUTPUT_DICTIONARY(@"name", self.alternateImageName);
    SYNOUTPUT_DICTIONARY(@"url", self.alternateImageUrl);
    SYNOUTPUT_DICTIONARY(@"width", self.alternateImageHeight);
    SYNOUTPUT_DICTIONARY(@"height", self.alternateImageWidth);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaAlternateImageMapping = [RKObjectMapping mappingForClass:[SynMediaAlternateImage class]];
    [mediaAlternateImageMapping addAttributeMappingsFromDictionary:@{
                                                                     @"id": @"alternateImageId",
                                                                     @"name": @"alternateImageName",
                                                                     @"url": @"alternateImageUrl",
                                                                     @"height": @"alternateImageHeight",
                                                                     @"width": @"alternateImageWidth",
                                                                     }];
    return mediaAlternateImageMapping;
}

@end