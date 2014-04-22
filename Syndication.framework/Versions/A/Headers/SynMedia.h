//
//  SynMedia.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaTags.h"
#import "SynSource.h"
#import "SynLanguage.h"

@class RKObjectMapping;

/**
 Base Media Information
 */
@interface SynMedia : NSObject

/// Media Type
@property (nonatomic, copy) NSString *mediaType;

/// Media ID
@property (nonatomic, copy) NSNumber *mediaId;

/// Media Name
@property (nonatomic, copy) NSString *mediaName;

/// Media Description
@property (nonatomic, copy) NSString *mediaDescription;

/// Media Source URL
@property (nonatomic, copy) NSString *mediaSourceUrl;

/// Media Date Content Authored
@property (nonatomic, copy) NSDate *mediaDateContentAuthored;

/// Media Date Content Updated
@property (nonatomic, copy) NSDate *mediaDateContentUpdated;

/// Media Date Content Published
@property (nonatomic, copy) NSDate *mediaDateContentPublished;

/// Media Date Content Reviewed
@property (nonatomic, copy) NSDate *mediaDateContentReviewed;

/// Media Date Syndication Visible
@property (nonatomic, copy) NSDate *mediaDateSyndicationVisible;

/// Media Date Syndication Captured
@property (nonatomic, copy) NSDate *mediaDateSyndicationCaptured;

/// Media Date Syndication Updated
@property (nonatomic, copy) NSDate *mediaDateSyndicationUpdated;

/// Media External GUID
@property (nonatomic, copy) NSString *mediaExternalGuid;

/// Media Content Hash
@property (nonatomic, copy) NSString *mediaContentHash;

/// Media Tiny URL
@property (nonatomic, copy) NSString *mediaTinyUrl;

/// Media Tiny Token
@property (nonatomic, copy) NSString *mediaTinyToken;

/// Media Thumbnail URL
@property (nonatomic, copy) NSString *mediaThumbnailUrl;

/// Media Attribution
@property (nonatomic, copy) NSString *mediaAttribution;

/// Media Extended Attributes
@property (nonatomic, copy) NSDictionary *mediaExtendedAttributes;

/// Media Campaigns
@property (nonatomic, strong) NSArray *mediaCampaigns;

/// Media Language
@property (nonatomic, strong) SynLanguage *mediaLanguage;

/// Media Source
@property (nonatomic, strong) SynSource *mediaSource;

/// Media Tags
@property (nonatomic, strong) SynMediaTags *mediaTags;

/// Media Alternate Images
@property (nonatomic, strong) NSArray *mediaAlternateImages;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mappingClass:(Class)mappingClass;

@end