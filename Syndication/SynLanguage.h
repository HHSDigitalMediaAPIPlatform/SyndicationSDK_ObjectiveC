//
//  SynLanguage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Language information
 */
@interface SynLanguage : NSObject

/// Launguage ID
@property (nonatomic, copy) NSNumber *languageId;

/// Language Name
@property (nonatomic, copy) NSString *languageName;

/// Language ISO Code
@property (nonatomic, copy) NSString *languageIsoCode;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
