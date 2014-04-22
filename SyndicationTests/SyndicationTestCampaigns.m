//
//  SyndicationTestCampaigns.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestCampaigns : XCTestCase
{
    Syndication *_syndication;
    SynCampaignResults *_campaignResults;
}
@end

@implementation SyndicationTestCampaigns

- (void) setUp
{
    [super setUp];

    _syndication = [Syndication syndication];
    
    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _campaignResults = nil;
    
    [super tearDown];
}

- (void) testGetCampaigns
{
    [_syndication getCampaigns:^(SynCampaignResults *campaignResults) {
        _campaignResults = campaignResults;
        [self notify:XCTAsyncTestCaseStatusSucceeded];
    }
                        failure:^(SynCampaignResults *campaignResults, NSError *error) {
                            _campaignResults = nil;
                            [self notify:XCTAsyncTestCaseStatusFailed];
                        }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_campaignResults, @"campaignResults nil: %s", __PRETTY_FUNCTION__);
    
    SynCampaign *campaign = [_campaignResults resultsObjects][0];
    
    XCTAssertNotNil(campaign, @"campaignResults resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);

}

@end
