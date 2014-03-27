//
//  SynLanguages.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"
#import "SynLanguages.h"
#import "RestKit.h"
#import "SynLanguage.h"

@implementation SynLanguages

#pragma mark - init/dealloc

- (id) init
{
    NSDictionary *mapping = @{
                              @"class": [SynLanguage class],
                              @"mapping": @{
                                      @"id": @"languageID",
                                      @"name": @"languageName",
                                      @"isoCode": @"languageIsoCode"
                                      },
                              };

    if (self = [super initWithMapping:mapping]) {
        
    }
    return self;
}

#pragma mark - methods

- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguages *languages))success
                         failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/languages.json"
                                         parameters:parameters
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                _results = mappingResult;
                                                NSLog(@"%@", mappingResult);
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                NSLog(@"failure: %@", error);
                                                failure(self, error);
                                            }
     ];

}

- (void) getLanguages:(void (^)(SynLanguages *languages))success
              failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    [self getLanguagesWithOptions:@{ }
                          success:success
                          failure:failure];
}

- (void) getLanguagesById:(NSUInteger)languageId
                  success:(void (^)(SynLanguages *languages))success
                  failure:(void (^)(SynLanguages *languages, NSError *error))failure
{
    
}

@end
