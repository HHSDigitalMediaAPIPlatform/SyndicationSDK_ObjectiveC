//
//  SynTagType.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Tag Type Information
 */
@interface SynTagType : NSObject

/// Tag Type ID
@property (nonatomic, copy) NSNumber *tagTypeId;

/// Tag Type Name
@property (nonatomic, copy) NSString *tagTypeName;

/// Tag Type Description
@property (nonatomic, copy) NSString *tagTypeDescription;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
