//
//  SynMediaEmbedResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynMediaEmbedResults : SynResults

+ (SynMediaEmbedResults *) embedResults;

/**
 Get the javascript for iframe embed code for this media item for embedding
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     flavor:            Currently supports 'iframe', 'javascript'.  Defaults to 'javascript'
     width:             The width of the generated iframe
     height:            The height of the generated iframe
     iframeName:        The name of the iframe element
     excludeJquery:     Should a reference to the JQuery Library be omitted?
     exludeDiv:         Should the div to insert content into be omitted?
     divId:             Should the div to insert content into have a specific name?
 
 @param mediaId The media Id to request the embed code for
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the raw `NSString` which contains the javascript embed code of the requested media item Id
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes one arguments: The `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaEmbedByMediaId:(NSUInteger)mediaId
                        options:(NSDictionary *)options
                        success:(void (^)(NSString *embedCode))success
                        failure:(void (^)(NSError *error))failure;

@end
