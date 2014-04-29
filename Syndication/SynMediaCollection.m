//
//  SynMediaCollection.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaCollection.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaCollection

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionaryWithDictionary:[super dictionary]];
    NSMutableArray *tmp = [NSMutableArray array];
    
    // "campaigns"
    if (self.mediaItems) {
        for (SynMedia *media in self.mediaItems) {
            [tmp addObject:[media dictionary]];
        }
    }
    SYNOUTPUT_DICTIONARY(@"mediaItems", tmp);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation
{
    RKObjectMapping *mediaMapping = [super mappingClass:[SynMediaCollection class]
                                         representation:representation];
    [mediaMapping addAttributeMappingsFromDictionary:@{
                                                       @"youtubeMetaData": @"mediaYoutubeMetaData",
                                                       }];
    
    
    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"mediaItems"
                                                                                 toKeyPath:@"mediaItems"
                                                                               withMapping:[SynMedia mappingClass:nil
                                                                                                   representation: @{ }]]];

    return mediaMapping;
}

@end
