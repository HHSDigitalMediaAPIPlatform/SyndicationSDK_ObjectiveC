//
//  SynMediaAlternateImageResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

/**
 Results set for the Alternate Image Media request operations.
 */
@interface SynMediaAlternateImageResults : SynResults

+ (SynMediaAlternateImageResults *) alternateImageResults;

/**
 Request the alternate images used by a specific media Id
 
 @param mediaId The media Id to request the alternate images of
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaAlternateImageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaAlternateImageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaAlternateImagesByMediaId:(NSUInteger)mediaId
                                  success:(void (^)(SynMediaAlternateImageResults *results))success
                                  failure:(void (^)(SynMediaAlternateImageResults *results, NSError *error))failure;

@end
