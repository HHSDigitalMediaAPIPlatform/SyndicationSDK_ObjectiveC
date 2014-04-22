//
//  SynMediaTags.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKMapping;

/**
 Media Tag Information
 */
@interface SynMediaTags : NSObject

/// Media Tags
@property (nonatomic, strong) NSDictionary *mediaTags;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKMapping *) mapping;

@end
