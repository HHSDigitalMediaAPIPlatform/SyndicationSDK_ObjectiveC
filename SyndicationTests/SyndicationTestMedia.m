//
//  SyndicationTestMedia.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Syndication/SyndicationSDK.h>
#import "XCTestCase+AsyncTesting.h"

@interface SyndicationTestMedia : XCTestCase
{
    Syndication *_syndication;
    SynMediaResults *_mediaResults;
    NSString *_content;
}
@end

@implementation SyndicationTestMedia

- (void) setUp
{
    [super setUp];
    
    _syndication = [Syndication syndication];

    XCTAssertNotNil(_syndication, @"Syndication object cannot be nil: %s", __PRETTY_FUNCTION__);
}

- (void) tearDown
{
    _syndication = nil;
    _mediaResults = nil;
    _content = nil;
    
    [super tearDown];
}

// Get Media object with Id #1 from server
- (void) testGetMediaById
{
    [_syndication getMediaById:1
                      success:^(SynMediaResults *mediaResults) {
                          _mediaResults = mediaResults;
                          [self notify:XCTAsyncTestCaseStatusSucceeded];
                      }
                      failure:^(SynMediaResults *mediaResults, NSError *error) {
                          _mediaResults = nil;
                          [self notify:XCTAsyncTestCaseStatusFailed];
                      }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaResults, @"mediaResults nil: %s", __PRETTY_FUNCTION__);
    
    SynMedia *media = [_mediaResults resultsObjects][0];
    
    XCTAssertNotNil(media, @"media resultsObjects[0] nil: %s", __PRETTY_FUNCTION__);
    
    NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!! %@", media.mediaTags);
    XCTAssertEqualObjects([media mediaId], [NSNumber numberWithInt:1], @"Media mediaId not '1': %s", __PRETTY_FUNCTION__);
    
    NSDictionary *mediaDictionary = [_mediaResults results][0];

    XCTAssertNotNil(media, @"media results[0] nil: %s", __PRETTY_FUNCTION__);
    
    XCTAssertEqualObjects([mediaDictionary objectForKey:@"id"], [NSNumber numberWithInt:1], @"Media mediaId not '1': %s", __PRETTY_FUNCTION__);
}

// Get one Video object from server
- (void) testGetMediaWithOptionsGetVideo
{
    [_syndication getMediaWithOptions:@{
                                        @"mediaTypes": @"Video",
                                        }
                       success:^(SynMediaResults *mediaResults) {
                           _mediaResults = mediaResults;
                           [self notify:XCTAsyncTestCaseStatusSucceeded];
                       }
                       failure:^(SynMediaResults *mediaResults, NSError *error) {
                           _mediaResults = nil;
                           [self notify:XCTAsyncTestCaseStatusFailed];
                       }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaResults, @"mediaResults nil: %s", __PRETTY_FUNCTION__);
    
    SynMediaVideo *media = [_mediaResults resultsObjects][0];
    
    XCTAssertNotNil(media, @"media results[0] nil: %s", __PRETTY_FUNCTION__);

    XCTAssertEqualObjects([media mediaType], @"Video", @"Media mediaType not 'Video': %s", __PRETTY_FUNCTION__);
}

// Fetch 2 media objects from the server, then loadMore (fetch 2 more)
- (void) testGetMediaPaginationMore
{
    [_syndication getMediaWithOptions:@{
                                        @"max": @"2",
                                        }
                              success:^(SynMediaResults *mediaResults) {
                                  _mediaResults = mediaResults;
                                  [self notify:XCTAsyncTestCaseStatusSucceeded];
                              }
                              failure:^(SynMediaResults *mediaResults, NSError *error) {
                                  _mediaResults = nil;
                                  [self notify:XCTAsyncTestCaseStatusFailed];
                              }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaResults, @"mediaResults nil: %s", __PRETTY_FUNCTION__);

    XCTAssert([_mediaResults count] == 2, @"mediaResults does not have 2 results in current set: %s", __PRETTY_FUNCTION__);
    
    // Fetch 2 more
    [_mediaResults loadMore:^(SynResults *results) {
        _mediaResults = (SynMediaResults *)results;
        [self notify:XCTAsyncTestCaseStatusSucceeded];
    }
                    failure:^(SynResults *results, NSError *error) {
                        _mediaResults = nil;
                        [self notify:XCTAsyncTestCaseStatusFailed];
                    }];

    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaResults, @"mediaResults nil: %s", __PRETTY_FUNCTION__);
    
    XCTAssert([_mediaResults count] == 4, @"mediaResults does not have 4 results in current set after loadMore: %s", __PRETTY_FUNCTION__);
}

// Find 1 HTML object then fetch its content by the Media Id
- (void) testGetMediaHTMLContent
{
    [_syndication getMediaWithOptions:@{
                                        @"mediaTypes": @"Html",
                                        @"max": @"1",
                                        }
                              success:^(SynMediaResults *mediaResults) {
                                  _mediaResults = mediaResults;
                                  [self notify:XCTAsyncTestCaseStatusSucceeded];
                              }
                              failure:^(SynMediaResults *mediaResults, NSError *error) {
                                  _mediaResults = nil;
                                  [self notify:XCTAsyncTestCaseStatusFailed];
                              }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_mediaResults, @"mediaResults nil: %s", __PRETTY_FUNCTION__);
    
    XCTAssert([_mediaResults count] == 1, @"mediaResults count > 1: %s", __PRETTY_FUNCTION__);

    SynMediaHTML *media = [_mediaResults resultsObjects][0];
    
    XCTAssertNotNil(media, @"media results[0] nil: %s", __PRETTY_FUNCTION__);
    
    XCTAssertEqualObjects([media mediaType], @"Html", @"Media mediaType not 'Html': %s", __PRETTY_FUNCTION__);

    [_syndication getMediaContentByMediaId:[[media mediaId] intValue]
                                   success:^(NSString *results) {
                                       _content = results;
                                       [self notify:XCTAsyncTestCaseStatusSucceeded];
                                   }
                                   failure:^(NSError *error) {
                                       _content = nil;
                                   }];
    
    [self waitForTimeout:10];
    
    XCTAssertNotNil(_content, @"content nil: %s", __PRETTY_FUNCTION__);
}

@end
