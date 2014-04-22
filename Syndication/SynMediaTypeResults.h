//
//  SynMediaTypeResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynMediaTypeResults : SynResults

+ (SynMediaTypeResults *) mediaTypeResults;

- (void) getMediaTypes:(void (^)(SynMediaTypeResults *mediaTypesResults))success
               failure:(void (^)(SynMediaTypeResults *mediaTypesREsults, NSError *error))failure;

@end
