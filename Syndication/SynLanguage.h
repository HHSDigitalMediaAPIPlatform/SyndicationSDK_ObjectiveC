//
//  SynLanguage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@interface SynLanguage : NSObject

@property (nonatomic, copy) NSNumber *languageID;
@property (nonatomic, copy) NSString *languageName;
@property (nonatomic, copy) NSString *languageIsoCode;

- (NSDictionary *) dictionary;

@end
