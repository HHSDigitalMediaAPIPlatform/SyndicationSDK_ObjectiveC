//
//  SynCampaignResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynCampaignResults : SynResults

+ (SynCampaignResults *) campaignResults;

/**
 Request media information from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynCampaignResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynCampaignResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getCampaignsWithOptions:(NSDictionary *)options
                         success:(void (^)(SynCampaignResults *campaignResults))success
                         failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure;

/**
 Request a specific campaign object from the Syndication API by campaign Id
 
 @param campaignId The campaign Id to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynCampaignResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynCampaignResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getCampaignById:(NSUInteger)campaignId
                 success:(void (^)(SynCampaignResults *mediaResults))success
                 failure:(void (^)(SynCampaignResults *mediaResults, NSError *error))failure;

@end