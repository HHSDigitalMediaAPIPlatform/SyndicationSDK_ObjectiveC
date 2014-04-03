//
//  SynMediaTags.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKMapping;

@interface SynMediaTags : NSObject

@property (nonatomic, strong) NSDictionary *mediaTags;

- (NSDictionary *) dictionary;
+ (RKMapping *) mapping;

@end
