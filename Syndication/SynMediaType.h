//
//  SynMediaType.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Media Type Information
 */
@interface SynMediaType : NSObject

/// Media Type Name
@property (nonatomic, copy) NSString *mediaTypeName;

/// Media Type Description
@property (nonatomic, copy) NSString *mediaTypeDescription;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
