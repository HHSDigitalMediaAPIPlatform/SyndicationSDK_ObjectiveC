//
//  SynMediaEmbedResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaEmbedResults.h"
#import "SynMediaEmbed.h"
#import "RestKit.h"
#import "SynErrors.h"

@implementation SynMediaEmbedResults

#pragma mark - init/dealloc

+ (SynMediaEmbedResults *) embedResults
{
    return (SynMediaEmbedResults *)[super resultsWithMapping:@{ @"mapping": [SynMediaEmbed mapping] }];
}

#pragma mark - methods

- (void) getMediaEmbedByMediaId:(NSUInteger)mediaId
                        options:(NSDictionary *)options
                        success:(void (^)(NSString *embedCode))success
                        failure:(void (^)(NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  @"flavor",
                                                                                  @"width",
                                                                                  @"height",
                                                                                  @"iframename",
                                                                                  @"excludeJquery",
                                                                                  @"excludeDiv",
                                                                                  @"divId",
                                                                                  ]];

    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/media/%lu/embed.json", (unsigned long)mediaId]
                                         parameters:parameters
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                SynMediaEmbed *embedObject = [[self resultsObjects] objectAtIndex:0];
                                                if (embedObject) {
                                                    success([embedObject embedSnippet]);
                                                } else {
                                                    NSDictionary *userInfo = @{ NSLocalizedDescriptionKey: @"Could not decode embed from response." };
                                                    failure([NSError errorWithDomain:SynErrorDomain code:SynGeneralError userInfo:userInfo]);
                                                }
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(error);
                                            }
     ];
}

@end
