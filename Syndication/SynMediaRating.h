//
//  SynMediaRating.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Media Rating Information
 */
@interface SynMediaRating : NSObject

/// Media Rating Likes
@property (nonatomic, copy) NSNumber *ratingLikes;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
