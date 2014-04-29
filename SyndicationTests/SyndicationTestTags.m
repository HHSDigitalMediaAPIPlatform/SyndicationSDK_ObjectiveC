//
//  SyndicationTestTags.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestTags : XCTestCase
{
    Syndication *_syndication;
    SynTagResults *_tagResults;
}

@end

@implementation SyndicationTestTags

- (void) setUp
{
    [super setUp];
    
    _syndication = [Syndication syndication];
    
    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _tagResults = nil;
    
    [super tearDown];
}

- (void) testGetTagTypes
{
    [_syndication getTagTypes:^(SynTagResults *results) {
        _tagResults = results;
        [self notify:XCTAsyncTestCaseStatusSucceeded];
    }
                      failure:^(SynTagResults *results, NSError *error) {
                          _tagResults = nil;
                          [self notify:XCTAsyncTestCaseStatusFailed];
                      }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_tagResults, @"tagResults nil: %s", __PRETTY_FUNCTION__);
    
    SynTagType *tagType = [_tagResults resultsObjects][0];
    
    XCTAssertNotNil(tagType, @"tagResults resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);
}

- (void) testGetTags
{
    [_syndication getTagsWithOptions:nil
                             success:^(SynTagResults *results) {
                                 _tagResults = results;
                                 [self notify:XCTAsyncTestCaseStatusSucceeded];
                             }
                             failure:^(SynTagResults *results, NSError *error) {
                                 _tagResults = nil;
                                 [self notify:XCTAsyncTestCaseStatusFailed];
                             }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_tagResults, @"tagResults nil: %s", __PRETTY_FUNCTION__);
    
    SynTag *tag = [_tagResults resultsObjects][0];
    
    XCTAssertNotNil(tag, @"tagResults resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);
}

@end
