//
//  SynMediaCampaign.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynMediaCampaign : NSObject

@property (nonatomic, copy) NSNumber *campaignId;
@property (nonatomic, copy) NSString *campaignName;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
