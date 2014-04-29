//
//  SynTagResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

/**
 Results set for the Tag request operations.
 */
@interface SynTagResults : SynResults

+ (SynTagResults *) tagResults;
+ (SynTagResults *) tagNestedResults;
+ (SynTagResults *) tagTypeResults;

/**
 Request tag type information from the Syndication API

 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynTagResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynTagResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getTagTypes:(void (^)(SynTagResults *results))success
             failure:(void (^)(SynTagResults *results, NSError *error))failure;

/**
 Request tag information from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:            The maximum number of records to return
     offset:         The offset of the records set to return for pagination.
     sort:           Which field to sort the records by.
     name:           Return tag[s] matching the supplied name
     nameContains:   Return tags which contain the supplied partial name
     syndicationId:  Returns tags associated with the supplied syndication Id
     typeId:         Return tags belonging to the supplied tag id
     typeName:       Return tags belonging to the supplied tag type name
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynTagResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynTagResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getTagsWithOptions:(NSDictionary *)options
                    success:(void (^)(SynTagResults *results))success
                    failure:(void (^)(SynTagResults *results, NSError *error))failure;

/**
 Request a specific tag object from the Syndication API by tag Id
 
 @param tagId The tag Id to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynTagResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynTagResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getTagById:(NSUInteger)tagId
            success:(void (^)(SynTagResults *results))success
            failure:(void (^)(SynTagResults *results, NSError *error))failure;

@end