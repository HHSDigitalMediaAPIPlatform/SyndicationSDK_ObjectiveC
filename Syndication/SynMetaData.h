//
//  SynMetaData.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 MetaData Information
 */
@interface SynMetaData : NSObject

/// Results Status
@property (nonatomic, copy) NSNumber *resultsStatus;

/// Results Messages
@property (nonatomic, strong) NSArray *resultsMessages;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
