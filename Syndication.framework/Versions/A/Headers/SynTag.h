//
//  SynTag.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Tag Information
 */
@interface SynTag : NSObject

/// Tag ID
@property (nonatomic, copy) NSNumber *tagId;

/// Tag Name
@property (nonatomic, copy) NSString *tagName;

/// Tag Language
@property (nonatomic, copy) NSString *tagLanguage;

/// Tag Type
@property (nonatomic, copy) NSString *tagType;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
