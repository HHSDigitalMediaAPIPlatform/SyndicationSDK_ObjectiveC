//
//  SynMediaRatingResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

/**
 Results set for the Media Rating request operations.
 */
@interface SynMediaRatingResults : SynResults

+ (SynMediaRatingResults *) ratingResults;

/**
 Get the 'like' count for the specified media item.
 
 @param mediaId The media Id to request the like count for
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the raw `NSNumber` which contains the number of likes for this media item
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes one arguments: The `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaRatingByMediaId:(NSUInteger)mediaId
                         success:(void (^)(NSNumber *ratingLikes))success
                         failure:(void (^)(NSError *error))failure;
@end
