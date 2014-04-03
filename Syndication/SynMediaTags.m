//
//  SynMediaTags.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaTags.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMediaTags

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outDict = [NSMutableDictionary dictionary];
    NSMutableArray *tmp = [NSMutableArray array];
    
    if (self.mediaTags) {
        for (NSString *key in self.mediaTags) {
            NSArray *objs = [self.mediaTags objectForKey:key];
            for (NSDictionary *dict in objs) {
                [tmp addObject:@{
                                 @"id": [dict objectForKey:@"id"],
                                 @"name": [dict objectForKey:@"name"],
                                 @"language": [dict objectForKey:@"language"],
                                 @"type": [dict objectForKey:@"type"],
                                 }];
            }
            [outDict setObject:tmp forKey:key];
            tmp = [NSMutableArray array];
        }
    }
    
    return outDict;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *mediaTagsMapping = [RKObjectMapping mappingForClass:[SynMediaTags class]];
    [mediaTagsMapping addAttributeMappingsFromDictionary:@{
                                                           @"tags": @"mediaTags",
                                                           }];
    return mediaTagsMapping;

}

@end
