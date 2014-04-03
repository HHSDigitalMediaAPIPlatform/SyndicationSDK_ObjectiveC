//
//  SynMediaTypeResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynMediaTypeResults : SynResults

+ (SynMediaTypeResults *) mediaTypeResults;

- (void) getMediaTypes:(void (^)(SynMediaTypeResults *mediaTypes))success
               failure:(void (^)(SynMediaTypeResults *mediaTypes, NSError *error))failure;

@end
