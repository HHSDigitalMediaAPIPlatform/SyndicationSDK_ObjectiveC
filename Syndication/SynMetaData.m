//
//  SynMetaData.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMetaData.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMetaData

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"status", self.resultsStatus);
    SYNOUTPUT_DICTIONARY(@"messages", self.resultsMessages);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *metaDataMapping = [RKObjectMapping mappingForClass:[SynMetaData class]];
    [metaDataMapping addAttributeMappingsFromDictionary:@{
                                                          @"status": @"resultsStatus",
                                                          @"messages": @"resultsMessages",
                                                          }];
    return metaDataMapping;
}

@end
