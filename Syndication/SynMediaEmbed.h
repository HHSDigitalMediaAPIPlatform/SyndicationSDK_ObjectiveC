//
//  SynMediaEmbed.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynMediaEmbed : NSObject

@property (nonatomic, copy) NSString *embedSnippet;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
