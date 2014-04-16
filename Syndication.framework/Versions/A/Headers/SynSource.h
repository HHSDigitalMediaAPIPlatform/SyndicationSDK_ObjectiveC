//
//  SynSource.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynSource : NSObject

@property (nonatomic, copy) NSNumber *sourceId;
@property (nonatomic, copy) NSString *sourceName;
@property (nonatomic, copy) NSString *sourceAcronym;
@property (nonatomic, copy) NSString *sourceWebsiteUrl;
@property (nonatomic, copy) NSString *sourceLargeLogoUrl;
@property (nonatomic, copy) NSString *sourceSmallLogoUrl;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
