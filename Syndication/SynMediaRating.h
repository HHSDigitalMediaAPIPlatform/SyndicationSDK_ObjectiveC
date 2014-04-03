//
//  SynMediaRating.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynMediaRating : NSObject

@property (nonatomic, copy) NSNumber *ratingLikes;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
