//
//  SynLanguage.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynLanguage.h"

@implementation SynLanguage

- (NSDictionary *) dictionary
{
    return @{
             @"id": self.languageID,
             @"name": self.languageName,
             @"isoCode": self.languageIsoCode
             };
}

@end
