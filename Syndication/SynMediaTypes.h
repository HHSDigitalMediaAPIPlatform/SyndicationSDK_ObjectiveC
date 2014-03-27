//
//  SynMediaTypes.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

@interface SynMediaTypes : SynResults

- (void) getMediaTypes:(void (^)(SynMediaTypes *mediaTypes))success
               failure:(void (^)(SynMediaTypes *mediaTypes, NSError *error))failure;

@end
