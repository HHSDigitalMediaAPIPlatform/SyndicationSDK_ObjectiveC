//
//  SynLanguageResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "SynPagination.h"
#import "SynLanguageResults.h"
#import "RestKit.h"
#import "SynLanguage.h"

@implementation SynLanguageResults

#pragma mark - init/dealloc

+ (SynLanguageResults *) languageResults
{
    return (SynLanguageResults *)[super resultsWithMapping:@{ @"mapping": [SynLanguage mapping] }];
}

#pragma mark - methods

- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguageResults *results))success
                         failure:(void (^)(SynLanguageResults *results, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/languages.json"
                                         parameters:parameters
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

- (void) getLanguageById:(NSUInteger)languageId
                 success:(void (^)(SynLanguageResults *results))success
                 failure:(void (^)(SynLanguageResults *results, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/languages/%lu.json", (unsigned long)languageId]
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

@end
