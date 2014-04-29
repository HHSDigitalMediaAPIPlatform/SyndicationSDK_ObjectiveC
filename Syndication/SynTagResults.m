//
//  SynTagResults.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Syndication.h"
#import "SynTagResults.h"
#import "SynTag.h"
#import "SynTagType.h"
#import "RestKit.h"

@implementation SynTagResults

#pragma mark - init/dealloc

+ (SynTagResults *) tagResults
{
    return (SynTagResults *)[super resultsWithMapping:@{ @"mapping": [SynTag mapping] }];
}

/* 
 * Since Tags come back from the server with an unknown tagType as a parent, we have to
 * create a dynamic mapping that will dynamically build the mappings based on the Tag types
 * after we receive them.  We shove them into a NSMutableDictionary and let special processing
 * in [self handleResults] handle this special case.
 */
+ (SynTagResults *) tagNestedResults
{
    
    RKDynamicMapping *dynamicMapping = [RKDynamicMapping new];

    [dynamicMapping setObjectMappingForRepresentationBlock:^RKObjectMapping *(id representation) {
        if ([representation isKindOfClass:[NSDictionary class]]) {
            RKObjectMapping *tagsMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
            for (NSString *key in representation) {
                [tagsMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:key
                                                                                            toKeyPath:key
                                                                                           withMapping:[SynTag mapping]]];
            }
            return tagsMapping;
        }
        return nil;
    }];
    
    return (SynTagResults *)[super resultsWithMapping:@{ @"results": [RKResponseDescriptor responseDescriptorWithMapping:dynamicMapping
                                                                                                                  method:RKRequestMethodGET
                                                                                                             pathPattern:nil
                                                                                                                 keyPath:@"results"
                                                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]
                                                                      ]
                                                         }
                             ];
}

+ (SynTagResults *) tagTypeResults
{
    return (SynTagResults *)[super resultsWithMapping:@{ @"mapping": [SynTagType mapping] }];
}

#pragma mark - methods

- (void) getTagTypes:(void (^)(SynTagResults *results))success
             failure:(void (^)(SynTagResults *results, NSError *error))failure
{
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/tagTypes.json"
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

- (void) getTagsWithOptions:(NSDictionary *)options
                    success:(void (^)(SynTagResults *results))success
                    failure:(void (^)(SynTagResults *results, NSError *error))failure
{
    NSDictionary *parameters = [self optionsToParameters:options acceptableKeys:@[
                                                                                  SYN_OFFSET,
                                                                                  SYN_MAX,
                                                                                  SYN_SORT,
                                                                                  @"name",
                                                                                  @"nameContains",
                                                                                  @"syndicationId",
                                                                                  @"typeId",
                                                                                  @"typeName",
                                                                                  ]];
    
    [RKObjectManager.sharedManager getObjectsAtPath:@"resources/tags.json"
                                         parameters:parameters
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

- (void) getTagById:(NSUInteger)tagId
            success:(void (^)(SynTagResults *results))success
            failure:(void (^)(SynTagResults *results, NSError *error))failure;
{
    [RKObjectManager.sharedManager getObjectsAtPath:[NSString stringWithFormat:@"resources/tags/%lu.json", (unsigned long)tagId]
                                         parameters:nil
                                            success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                [self handleResults:mappingResult];
                                                success(self);
                                            }
                                            failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                [self handleResults:nil];
                                                failure(self, error);
                                            }
     ];
}

@end
