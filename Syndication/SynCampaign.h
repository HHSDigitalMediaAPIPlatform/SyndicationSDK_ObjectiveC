//
//  SynCampaign.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynCampaign : NSObject

@property (nonatomic, copy) NSNumber *campaignId;
@property (nonatomic, copy) NSString *campaignName;
@property (nonatomic, copy) NSString *campaignDescription;
@property (nonatomic, copy) NSDate *campaignStartDate;
@property (nonatomic, copy) NSDate *campaignEndDate;
@property (nonatomic, copy) NSString *campaignSource;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
