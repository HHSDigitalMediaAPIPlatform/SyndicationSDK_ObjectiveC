//
//  SynLanguageResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynLanguageResults : SynResults

+ (SynLanguageResults *) languageResults;

/**
 Request languages from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     SYN_OFFSET:  The offset of the records set to return for pagination (0 based)
     SYN_MAX:     The maximum number of records to return
     SYN_SORT:    The name of the property to which sorting will be applied
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguageResults *languages))success
                         failure:(void (^)(SynLanguageResults *languages, NSError *error))failure;

/**
 Request a specific language from the Syndication API by language ID
 
 @param languageId The language ID to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguageById:(NSUInteger)languageId
                 success:(void (^)(SynLanguageResults *languages))success
                 failure:(void (^)(SynLanguageResults *languages, NSError *error))failure;

@end