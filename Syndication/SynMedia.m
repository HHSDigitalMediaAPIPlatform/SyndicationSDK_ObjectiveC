//
//  SynMedia.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"
#import "SynMediaAlternateImage.h"
#import "SynMediaCampaign.h"
#import "SynMediaTags.h"
#import "SynResults.h"
#import "RestKit.h"

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

    // "campaigns"
    tmp = [NSMutableArray array];
    if (self.mediaCampaigns) {
        for (SynMediaCampaign *campaign in self.mediaCampaigns) {
            [tmp addObject:[campaign dictionary]];
        }
    }
    SYNOUTPUT_DICTIONARY(@"campaigns", tmp);
    
    // "language"
    SYNOUTPUT_DICTIONARY(@"languageId", self.mediaLanguageId);
    SYNOUTPUT_DICTIONARY(@"languageName", self.mediaLanguageName);
    SYNOUTPUT_DICTIONARY(@"languageIsoCode", self.mediaLanguageIsoCode);
    
    // "source"
    SYNOUTPUT_DICTIONARY(@"sourceId", self.mediaSourceId);
    SYNOUTPUT_DICTIONARY(@"sourceName", self.mediaSourceName);
    SYNOUTPUT_DICTIONARY(@"sourceAcronym", self.mediaSourceAcronym);
    SYNOUTPUT_DICTIONARY(@"sourceWebsiteUrl", self.mediaSourceWebsiteUrl);
    SYNOUTPUT_DICTIONARY(@"sourceLargeLogoUrl", self.mediaSourceLargeLogoUrl);
    SYNOUTPUT_DICTIONARY(@"sourceSmallLogoUrl", self.mediaSourceSmallLogoUrl);

    // "tags"
    SYNOUTPUT_DICTIONARY(@"tags", [self.mediaTags dictionary]);
    
    // "alternateImages"
    tmp = [NSMutableArray array];
    if (self.mediaAlternateImages) {
        for (SynMediaAlternateImage *alternateImage in self.mediaAlternateImages) {
            [tmp addObject:[alternateImage dictionary]];
        }
    }
    SYNOUTPUT_DICTIONARY(@"alternateImages", tmp);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mappingClass:(Class)mappingClass
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
                                                       
                                                       // "language"
                                                       @"language.id": @"mediaLanguageId",
                                                       @"language.name": @"mediaLanguageName",
                                                       @"language.isoCode": @"mediaLanguageIsoCode",
                                                       
                                                       // "source"
                                                       @"source.id": @"mediaSourceId",
                                                       @"source.name": @"mediaSourceName",
                                                       @"source.websiteUrl": @"mediaSourceWebsiteUrl",
                                                       @"source.acronym": @"mediaSourceAcronym",
                                                       @"source.largeLogoUrl": @"mediaSourceLargeLogoUrl",
                                                       @"source.smallLogoUrl": @"mediaSourceSmallLogoUrl",
                                                       }];

    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"campaigns"
                                                                                 toKeyPath:@"mediaCampaigns"
                                                                               withMapping:[SynMediaCampaign mapping]]];

    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"tags"
                                                                                 toKeyPath:@"mediaTags"
                                                                               withMapping:[SynMediaTags mapping]]];
    
    [mediaMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"alternateImages"
                                                                                 toKeyPath:@"mediaAlternateImages"
                                                                               withMapping:[SynMediaAlternateImage mapping]]];

    return mediaMapping;
}

@end
