//
//  SyndicationTestMediaTypes.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestMediaTypes : XCTestCase
{
    Syndication *_syndication;
    SynMediaTypeResults *_mediaTypesResults;
}
@end

@implementation SyndicationTestMediaTypes

- (void) setUp
{
    [super setUp];

    _syndication = [Syndication syndication];
    
    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _mediaTypesResults = nil;
    
    [super tearDown];
}

- (void) testGetMediaTypes
{
    [_syndication getMediaTypes:^(SynMediaTypeResults *mediaTypesResults) {
                           _mediaTypesResults = mediaTypesResults;
                           [self notify:XCTAsyncTestCaseStatusSucceeded];
                       }
                       failure:^(SynMediaTypeResults *mediaTypesResults, NSError *error) {
                           _mediaTypesResults = nil;
                           [self notify:XCTAsyncTestCaseStatusFailed];
                       }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaTypesResults, @"mediaTypesResults nil: %s", __PRETTY_FUNCTION__);
    
    SynMediaType *mediaType = [_mediaTypesResults resultsObjects][0];
    
    XCTAssertNotNil(mediaType, @"mediaType resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);
}

@end
