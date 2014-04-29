//
//  SynMetaData.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMetaData.h"
#import "SynMessage.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMetaData

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    NSMutableArray *tmp = [NSMutableArray array];
    
    SYNOUTPUT_DICTIONARY(@"status", self.resultsStatus);

    // "messages"
    if (self.resultsMessages) {
        for (SynMessage *message in self.resultsMessages) {
            [tmp addObject:[message dictionary]];
        }
        SYNOUTPUT_DICTIONARY(@"messages", tmp);
    }
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *metaDataMapping = [RKObjectMapping mappingForClass:[SynMetaData class]];
    [metaDataMapping addAttributeMappingsFromDictionary:@{
                                                          @"status": @"resultsStatus",
                                                          }];

    // "messages"
    [metaDataMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"messages"
                                                                                    toKeyPath:@"resultsMessages"
                                                                                  withMapping:[SynMessage mapping]]];

    return metaDataMapping;
}

@end
