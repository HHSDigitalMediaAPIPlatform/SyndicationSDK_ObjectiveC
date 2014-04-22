//
//  SynMediaEmbed.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Media Embed Information
 */
@interface SynMediaEmbed : NSObject

/// Media Embed Snippet
@property (nonatomic, copy) NSString *embedSnippet;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
