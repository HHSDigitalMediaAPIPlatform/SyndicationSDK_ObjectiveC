//
//  SynLanguage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynLanguage : NSObject

@property (nonatomic, copy) NSNumber *languageID;
@property (nonatomic, copy) NSString *languageName;
@property (nonatomic, copy) NSString *languageIsoCode;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
