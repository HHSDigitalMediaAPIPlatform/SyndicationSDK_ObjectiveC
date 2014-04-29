//
//  SynMedia.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"
#import "SynMediaAlternateImage.h"
#import "SynCampaign.h"
#import "SynResults.h"
#import "RestKit.h"
#import "SynTag.h"

@implementation SynMedia

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    NSMutableArray *tmp;
    
    SYNOUTPUT_DICTIONARY(@"mediaType", self.mediaType);
    SYNOUTPUT_DICTIONARY(@"id", self.mediaId);
    SYNOUTPUT_DICTIONARY(@"name", self.mediaName);
    SYNOUTPUT_DICTIONARY(@"description", self.mediaDescription);
    SYNOUTPUT_DICTIONARY(@"sourceUrl", self.mediaSourceUrl);
    SYNOUTPUT_DICTIONARY(@"dateContentAuthored", self.mediaDateContentAuthored);
    SYNOUTPUT_DICTIONARY(@"dateContentUpdated", self.mediaDateContentUpdated);
    SYNOUTPUT_DICTIONARY(@"dateContentPublished", self.mediaDateContentPublished);
    SYNOUTPUT_DICTIONARY(@"dateContentReviewed", self.mediaDateContentReviewed);
    SYNOUTPUT_DICTIONARY(@"dateSyndicationVisible", self.mediaDateSyndicationVisible);
    SYNOUTPUT_DICTIONARY(@"dateSyndicationCaptured", self.mediaDateSyndicationCaptured);
    SYNOUTPUT_DICTIONARY(@"dateSyndicationUpdated", self.mediaDateSyndicationUpdated);
    SYNOUTPUT_DICTIONARY(@"externalGuid", self.mediaExternalGuid);
    SYNOUTPUT_DICTIONARY(@"contentHash", self.mediaContentHash);
    SYNOUTPUT_DICTIONARY(@"tinyUrl", self.mediaTinyUrl);
    SYNOUTPUT_DICTIONARY(@"tinyToken", self.mediaTinyToken);
    SYNOUTPUT_DICTIONARY(@"thumbnailUrl", self.mediaThumbnailUrl);
    SYNOUTPUT_DICTIONARY(@"attribution", self.mediaAttribution);
    SYNOUTPUT_DICTIONARY(@"extendedAttributes", self.mediaExtendedAttributes);
    SYNOUTPUT_DICTIONARY(@"language", [self.mediaLanguage dictionary]);
    SYNOUTPUT_DICTIONARY(@"source", [self.mediaSource dictionary]);

    // "campaigns"
    tmp = [NSMutableArray array];
    if (self.mediaCampaigns) {
        for (SynCampaign *campaign in self.mediaCampaigns) {
            [tmp addObject:[campaign dictionary]];
        }
        SYNOUTPUT_DICTIONARY(@"campaigns", tmp);
    }

    // "tags"
//    SYNOUTPUT_DICTIONARY(@"tags", [self.mediaTags dictionary]);
    
    // "alternateImages"
    tmp = [NSMutableArray array];
    if (self.mediaAlternateImages) {
        for (SynMediaAlternateImage *alternateImage in self.mediaAlternateImages) {
            [tmp addObject:[alternateImage dictionary]];
        }
        SYNOUTPUT_DICTIONARY(@"alternateImages", tmp);
    }
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingClass:(Class)mappingClass
                    representation:(NSDictionary *)representation
{
    if (!mappingClass) {
        mappingClass = [SynMedia class];
    }
    RKObjectMapping *mediaMapping = [RKObjectMapping mappingForClass:mappingClass];
    [mediaMapping addAttributeMappingsFromDictionary:@{
                                                       @"mediaType": @"mediaType",
                                                       @"id": @"mediaId",
                                                       @"name": @"mediaName",
                                                       @"description": @"mediaDescription",
                                                       @"sourceUrl": @"mediaSourceUrl",
                                                       @"dateContentAuthored": @"mediaDateContentAuthored",
                                                       @"dateContentUpdated": @"mediaDateContentUpdated",
                                                       @"dateContentPublished": @"mediaDateContentPublished",
                                                       @"dateContentReviewed": @"mediaDateContentReviewed",
                                                       @"dateSyndicationVisible": @"mediaDateSyndicationVisible",
                                                       @"dateSyndicationCaptured": @"mediaDateSyndicationCaptured",
                                                       @"dateSyndicationUpdated": @"mediaDateSyndicationUpdated",
                                                       @"externalGuid": @"mediaExternalGuid",
                                                       @"contentHash": @"mediaContentHash",
                                                       @"tinyUrl": @"mediaTinyUrl",
                                                       @"tinyToken": @"mediaTinyToken",
                                                       @"thumbnailUrl": @"mediaThumbnailUrl",
                                                       @"attribution": @"mediaAttribution",
                                                       @"extendedAttributes": @"mediaExtendedAttributes",
                                                       }];

    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"language"
                                                                                 toKeyPath:@"mediaLanguage"
                                                                               withMapping:[SynLanguage mapping]]];

    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"source"
                                                                                 toKeyPath:@"mediaSource"
                                                                               withMapping:[SynSource mapping]]];
    
    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"campaigns"
                                                                                 toKeyPath:@"mediaCampaigns"
                                                                               withMapping:[SynCampaign mapping]]];

    if (representation
        && representation[@"tags"]
        && [representation[@"tags"] isKindOfClass:[NSDictionary class]]
        && representation[@"tags"][@"tags"]) {
        /*
         * Special handling for tags because we don't know (at build time) the exact mapping
         * that will be below the tags object since the direct descendant of tags is a hash of tag type
         * names.  We shove them in a NSMutableDictionary and let the handleResults function handle
         * this special case.
         */
        RKObjectMapping *tagsMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
        for (NSString *key in representation[@"tags"][@"tags"]) {
            [tagsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:key
                                                                                        toKeyPath:key
                                                                                      withMapping:[SynTag mapping]]];
        }

        [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"tags.tags"
                                                                                     toKeyPath:@"mediaTags"
                                                                                   withMapping:tagsMapping]];
    }
    
    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"alternateImages"
                                                                                 toKeyPath:@"mediaAlternateImages"
                                                                               withMapping:[SynMediaAlternateImage mapping]]];

    return mediaMapping;
}

@end
