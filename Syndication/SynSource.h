//
//  SynSource.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Source Information
 */
@interface SynSource : NSObject

/// Source ID
@property (nonatomic, copy) NSNumber *sourceId;

/// Source Name
@property (nonatomic, copy) NSString *sourceName;

/// Source Acronym
@property (nonatomic, copy) NSString *sourceAcronym;

/// Source Website URL
@property (nonatomic, copy) NSString *sourceWebsiteUrl;

/// Source Large Logo URL
@property (nonatomic, copy) NSString *sourceLargeLogoUrl;

/// Source Small Logo URL
@property (nonatomic, copy) NSString *sourceSmallLogoUrl;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
