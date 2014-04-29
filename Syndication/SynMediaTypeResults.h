//
//  SynMediaTypeResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynMediaTypeResults : SynResults

+ (SynMediaTypeResults *) mediaTypeResults;

- (void) getMediaTypes:(void (^)(SynMediaTypeResults *results))success
               failure:(void (^)(SynMediaTypeResults *results, NSError *error))failure;

@end
