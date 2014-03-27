//
//  SynLanguages.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynLanguages : SynResults

- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguages *languages))success
                         failure:(void (^)(SynLanguages *languages, NSError *error))failure;

- (void) getLanguages:(void (^)(SynLanguages *languages))success
              failure:(void (^)(SynLanguages *languages, NSError *error))failure;

/**
 Request a specific language from the Syndication API by language ID
 
 @param languageId The language ID to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguages` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguages` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguagesById:(NSUInteger)languageId
                  success:(void (^)(SynLanguages *languages))success
              failure:(void (^)(SynLanguages *languages, NSError *error))failure;

@end