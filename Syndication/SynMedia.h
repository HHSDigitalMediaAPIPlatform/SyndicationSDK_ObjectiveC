//
//  SynMedia.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaTags.h"

@class RKObjectMapping;

@interface SynMedia : NSObject

@property (nonatomic, copy) NSString *mediaType;
@property (nonatomic, copy) NSNumber *mediaId;
@property (nonatomic, copy) NSString *mediaName;
@property (nonatomic, copy) NSString *mediaDescription;
@property (nonatomic, copy) NSString *mediaSourceUrl;
@property (nonatomic, copy) NSDate *mediaDateContentAuthored;
@property (nonatomic, copy) NSDate *mediaDateContentUpdated;
@property (nonatomic, copy) NSDate *mediaDateContentPublished;
@property (nonatomic, copy) NSDate *mediaDateContentReviewed;
@property (nonatomic, copy) NSDate *mediaDateSyndicationVisible;
@property (nonatomic, copy) NSDate *mediaDateSyndicationCaptured;
@property (nonatomic, copy) NSDate *mediaDateSyndicationUpdated;
@property (nonatomic, copy) NSString *mediaExternalGuid;
@property (nonatomic, copy) NSString *mediaContentHash;
@property (nonatomic, copy) NSString *mediaTinyUrl;
@property (nonatomic, copy) NSString *mediaTinyToken;
@property (nonatomic, copy) NSString *mediaThumbnailUrl;
@property (nonatomic, copy) NSString *mediaAttribution;
@property (nonatomic, copy) NSDictionary *mediaExtendedAttributes;
@property (nonatomic, strong) NSArray *mediaCampaigns;

// "language"
@property (nonatomic, copy) NSString *mediaLanguageId;
@property (nonatomic, copy) NSString *mediaLanguageName;
@property (nonatomic, copy) NSString *mediaLanguageIsoCode;

// "source"
@property (nonatomic, copy) NSNumber *mediaSourceId;
@property (nonatomic, copy) NSString *mediaSourceName;
@property (nonatomic, copy) NSString *mediaSourceAcronym;
@property (nonatomic, copy) NSString *mediaSourceWebsiteUrl;
@property (nonatomic, copy) NSString *mediaSourceLargeLogoUrl;
@property (nonatomic, copy) NSString *mediaSourceSmallLogoUrl;

// "tags"
@property (nonatomic, strong) SynMediaTags *mediaTags;

// "alternateImages"
@property (nonatomic, strong) NSArray *mediaAlternateImages;


- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mappingClass:(Class)mappingClass;

@end