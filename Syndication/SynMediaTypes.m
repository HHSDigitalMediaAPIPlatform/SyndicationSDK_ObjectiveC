//
//  SynMediaTypes.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"
#import "SynMediaTypes.h"
#import "RestKit.h"
#import "SynMediaType.h"

@implementation SynMediaTypes

#pragma mark - init/dealloc

- (id) init
{
    NSDictionary *mapping = @{
                              @"class": [SynMediaType class],
                              @"mapping": @{
                                      @"name": @"mediaTypeName",
                                      @"description": @"mediaTypeDescription",
                                      },
                              };
    
    if (self = [super initWithMapping:mapping]) {
        
    }
    return self;
}

#pragma mark - methods

- (void) getMediaTypes:(void (^)(SynMediaTypes *mediaTypes))success
               failure:(void (^)(SynMediaTypes *mediaTypes, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/mediaTypes.json"
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                _results = mappingResult;
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                failure(self, error);
                                            }
     ];
}

@end