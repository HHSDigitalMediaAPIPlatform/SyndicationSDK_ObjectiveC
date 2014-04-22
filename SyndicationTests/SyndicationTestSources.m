//
//  SyndicationTestSources.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestSources : XCTestCase
{
    Syndication *_syndication;
    SynSourceResults *_sourceResults;
}

@end

@implementation SyndicationTestSources

- (void) setUp
{
    [super setUp];
    
    _syndication = [Syndication syndication];
    
    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _sourceResults = nil;
    
    [super tearDown];
}

- (void) testGetSources
{
    [_syndication getSources:^(SynSourceResults *sourceResults) {
        _sourceResults = sourceResults;
        [self notify:XCTAsyncTestCaseStatusSucceeded];
    }
                       failure:^(SynSourceResults *sourceResults, NSError *error) {
                           _sourceResults = nil;
                           [self notify:XCTAsyncTestCaseStatusFailed];
                       }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_sourceResults, @"sourceResults nil: %s", __PRETTY_FUNCTION__);
    
    SynSource *source = [_sourceResults resultsObjects][0];
    
    XCTAssertNotNil(source, @"sourceResults resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);    
}

@end
