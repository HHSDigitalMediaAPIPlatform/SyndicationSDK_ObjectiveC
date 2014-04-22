//
//  SynCampaign.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/** 
 Campaign information
 */
 
@interface SynCampaign : NSObject

/// Campaign ID
@property (nonatomic, copy) NSNumber *campaignId;

/// Campaign Name
@property (nonatomic, copy) NSString *campaignName;

/// Campaign Description
@property (nonatomic, copy) NSString *campaignDescription;

/// Campaign Start Date
@property (nonatomic, copy) NSDate *campaignStartDate;

/// Campaign End Date
@property (nonatomic, copy) NSDate *campaignEndDate;

/// Campaign Source
@property (nonatomic, copy) NSString *campaignSource;

/// Campaign Contact Email
@property (nonatomic, copy) NSString *campaignContactEmail;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
