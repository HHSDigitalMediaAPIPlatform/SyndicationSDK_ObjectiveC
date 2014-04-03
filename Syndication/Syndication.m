//
//  Syndication.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "RestKit.h"

#import "SynLanguageResults.h"
#import "SynMediaTypeResults.h"
#import "SynMediaResults.h"

#import "SynMediaAlternateImageResults.h"
#import "SynMediaEmbedResults.h"
#import "SynMediaRatingResults.h"

#import "SynCampaignResults.h"

#import "SynSourceResults.h"

@implementation Syndication

NSMutableDictionary *_apiOptions;
RKObjectManager *_manager;

#pragma mark - init/dealloc

- (id) initWithOptions:(NSDictionary *)apiOptions
{
    if (self = [super init]) {
        _apiOptions = [apiOptions mutableCopy];
        [self setupMapping];
    }
    return self;
}

+ (Syndication *) syndicationWithOptions:(NSDictionary *)options
{
    return [[Syndication alloc] initWithOptions:options];
}

+ (Syndication *) syndication
{
    return [Syndication syndicationWithOptions:@{ APIOPT_SYNDICATION_BASE : SYNDICATION_BASE_URL }];
}

#pragma mark - Setup functions

- (void) setupMapping
{
    NSString *fullURL = [_apiOptions objectForKey:APIOPT_SYNDICATION_URL];
    if (!fullURL) {
        fullURL = [NSString stringWithFormat:@"%@/api/%@", [_apiOptions objectForKey:APIOPT_SYNDICATION_BASE], SYNDICATION_API_VERSION];
        [_apiOptions setObject:fullURL forKey:APIOPT_SYNDICATION_URL];
    }
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:fullURL]];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    _manager = [[RKObjectManager alloc] initWithHTTPClient:client];
}

#pragma mark - Campaign functions

- (void) getCampaigns:(void (^)(SynCampaignResults *campaignResults))success
              failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure
{
    [self getCampaignsWithOptions:@{ } success:success failure:failure];
}

- (void) getCampaignsWithOptions:(NSDictionary *)options
                         success:(void (^)(SynCampaignResults *campaignResults))success
                         failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure
{
    [[SynCampaignResults campaignResults] getCampaignsWithOptions:options success:success failure:failure];
}

- (void) getCampaignById:(NSUInteger)campaignId
                 success:(void (^)(SynCampaignResults *mediaResults))success
                 failure:(void (^)(SynCampaignResults *mediaResults, NSError *error))failure
{
    [[SynCampaignResults campaignResults] getCampaignById:campaignId success:success failure:failure];
}

#pragma mark - Media functions

- (void) getMedia:(void (^)(SynMediaResults *mediaResults))success
          failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [self getMediaWithOptions:@{ } success:success failure:failure];
}

- (void) getMediaWithOptions:(NSDictionary *)options
                     success:(void (^)(SynMediaResults *mediaResults))success
                     failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] getMediaWithOptions:options success:success failure:failure];
}

- (void) getMediaRelatedToMediaId:(NSUInteger)mediaId
                          options:(NSDictionary *)options
                          success:(void (^)(SynMediaResults *mediaResults))success
                          failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] getMediaRelatedToMediaId:mediaId options:options success:success failure:failure];
}

- (void) getMediaPopularWithOptions:(NSDictionary *)options
                            success:(void (^)(SynMediaResults *mediaResults))success
                            failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] getMediaPopularWithOptions:options success:success failure:failure];
}

- (void) getMediaByCampaignId:(NSUInteger)campaignId
                      options:(NSDictionary *)options
                      success:(void (^)(SynMediaResults *mediaResults))success
                      failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] getMediaByCampaignId:campaignId options:options success:success failure:failure];

}

- (void) getMediaById:(NSUInteger)mediaId
              success:(void (^)(SynMediaResults *mediaResults))success
              failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] getMediaById:mediaId success:success failure:failure];
}

- (void) searchMedia:(NSString *)searchString
             success:(void (^)(SynMediaResults *mediaResults))success
             failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure
{
    [[SynMediaResults mediaResults] searchMedia:searchString success:success failure:failure];
}

- (void) getMediaAlternateImagesByMediaId:(NSUInteger)mediaId
                                  success:(void (^)(SynMediaAlternateImageResults *mediaResults))success
                                  failure:(void (^)(SynMediaAlternateImageResults *mediaResults, NSError *error))failure
{
    [[SynMediaAlternateImageResults alternateImageResults] getMediaAlternateImagesByMediaId:mediaId success:success failure:failure];
}

- (void) getMediaContentByMediaId:(NSUInteger)mediaId
                          success:(void (^)(NSString *content))success
                          failure:(void (^)(NSError *error))failure
{
    // This isn't a real RestKit query since it returns raw HTML.  We just need to
    // create a request and shoot the raw response back.
    NSMutableURLRequest *request = [[_manager HTTPClient] requestWithMethod:@"GET" path:[NSString stringWithFormat:@"resources/media/%d/content", mediaId] parameters:nil];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest: request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(operation.responseString);
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    [[_manager operationQueue] addOperation:operation];
}

- (void) getMediaEmbedByMediaId:(NSUInteger)mediaId
                        options:(NSDictionary *)options
                        success:(void (^)(NSString *embedCode))success
                        failure:(void (^)(NSError *error))failure
{
    [[SynMediaEmbedResults embedResults] getMediaEmbedByMediaId:mediaId options:options success:success failure:failure];
}

- (void) getMediaRatingByMediaId:(NSUInteger)mediaId
                         success:(void (^)(NSNumber *ratingLikes))success
                         failure:(void (^)(NSError *error))failure
{
    [[SynMediaRatingResults ratingResults] getMediaRatingByMediaId:mediaId success:success failure:failure];
}

#pragma mark - Languages functions

- (void) getLanguages:(void (^)(SynLanguageResults *languages))success
              failure:(void (^)(SynLanguageResults *languages, NSError *error))failure
{
    [self getLanguagesWithOptions:@{ } success:success failure:failure];
}

- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguageResults *languages))success
                         failure:(void (^)(SynLanguageResults *languages, NSError *error))failure
{
    [[SynLanguageResults languageResults] getLanguagesWithOptions:options success:success failure:failure];
}

- (void) getLanguageById:(NSUInteger)languageId
                 success:(void (^)(SynLanguageResults *languages))success
                 failure:(void (^)(SynLanguageResults *languages, NSError *error))failure
{
    [[SynLanguageResults languageResults] getLanguageById:languageId success:success failure: failure];
}

#pragma mark - MediaTypes functions

- (void) getMediaTypes:(void (^)(SynMediaTypeResults *mediaTypes))success
               failure:(void (^)(SynMediaTypeResults *mediaTypes, NSError *error))failure
{
    [[SynMediaTypeResults mediaTypeResults] getMediaTypes:success failure:failure];
}

#pragma mark - Sources functions

- (void) getSources:(void (^)(SynSourceResults *sourceResults))success
            failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure
{
    [self getSourcesWithOptions:@{ } success:success failure:failure];
}

- (void) getSourcesWithOptions:(NSDictionary *)options
                       success:(void (^)(SynSourceResults *sourceResults))success
                       failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure
{
    [[SynSourceResults sourceResults] getSourcesWithOptions:options success:success failure:failure];
}

- (void) getSourceById:(NSUInteger)sourceId
               success:(void (^)(SynSourceResults *sourceResults))success
               failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure
{
    [[SynSourceResults sourceResults] getSourceById:sourceId success:success failure:failure];
}

@end
