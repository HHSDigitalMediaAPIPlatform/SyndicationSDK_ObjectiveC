//
//  Syndication.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "SynLanguages.h"
#import "SynMediaTypes.h"
#import "RestKit.h"

@implementation Syndication

NSDictionary *_apiOptions;
RKObjectManager *_manager;

#pragma mark - init/dealloc

- (id) initWithOptions:(NSDictionary *)apiOptions
{
    if (self = [super init]) {
        if (apiOptions) {
            _apiOptions = apiOptions;
        }
        [self setupMapping];
    }
    return self;
}

- (id) initWithURL:(NSString *)URL
{
    if (self = [super init]) {
        if (URL) {
            _apiOptions = @{ APIOPT_SYNDICATION_BASE : URL };
        }
        [self setupMapping];
    }
    return self;
}

- (id) init
{
    if (self = [super init]) {
        _apiOptions = @{ APIOPT_SYNDICATION_BASE : SYNDICATION_BASE_URL };
        [self setupMapping];
    }
    return self;
}

#pragma mark - Setup functions

- (void) setupMapping
{
    NSString *baseURL = [NSString stringWithFormat:@"%@/api/%@", [_apiOptions objectForKey:APIOPT_SYNDICATION_BASE], SYNDICATION_API_VERSION];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
    [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
    _manager = [[RKObjectManager alloc] initWithHTTPClient:client];
}

#pragma mark - client functions

#pragma mark - Languages functions

- (void) getLanguages:(void (^)(SynLanguages *languages))success
              failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    [self getLanguagesWithOptions:@{ }
                          success:success
                          failure:failure];
}

- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguages *languages))success
                         failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    SynLanguages *synLanguages = [[SynLanguages alloc] init];
    
    [synLanguages getLanguagesWithOptions:options
                                  success:success
                                  failure:failure];
}

- (void) getLanguagesById:(NSUInteger)languageId
                  success:(void (^)(SynLanguages *languages))success
                  failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    [self getLanguagesWithOptions:@{ @"id": [NSNumber numberWithInt:languageId] }
                          success:success
                          failure:failure];
}

#pragma mark - MediaTypes functions

- (void) getMediaTypes:(void (^)(SynMediaTypes *mediaTypes))success
               failure:(void (^)(SynMediaTypes *mediaTypes, NSError *error))failure
{
    SynMediaTypes *synMediaTypes = [[SynMediaTypes alloc] init];
    
    [synMediaTypes getMediaTypes:success
                         failure:failure];
}

@end
