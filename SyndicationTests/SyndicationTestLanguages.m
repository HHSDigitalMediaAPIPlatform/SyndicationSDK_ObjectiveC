//
//  SyndicationTestLanguages.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestLanguages : XCTestCase
{
    Syndication *_syndication;
    SynLanguageResults *_languageResults;
}
@end

@implementation SyndicationTestLanguages

- (void) setUp
{
    [super setUp];
    
    _syndication = [Syndication syndication];
    
    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _languageResults = nil;
    
    [super tearDown];
}

- (void) testGetLanguages
{
    [_syndication getLanguages:^(SynLanguageResults *languageResults) {
        _languageResults = languageResults;
        [self notify:XCTAsyncTestCaseStatusSucceeded];
    }
                       failure:^(SynLanguageResults *languageResults, NSError *error) {
                           _languageResults = nil;
                           [self notify:XCTAsyncTestCaseStatusFailed];
                       }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_languageResults, @"languageResults nil: %s", __PRETTY_FUNCTION__);
    
    SynLanguage *language = [_languageResults resultsObjects][0];
    
    XCTAssertNotNil(language, @"languageResults resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);
    
}

@end
