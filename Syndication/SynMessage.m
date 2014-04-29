//
//  SynMessage.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMessage.h"
#import "SynResults.h"
#import "RestKit.h"

@implementation SynMessage

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"errorMessage", self.messageErrorMessage);
    SYNOUTPUT_DICTIONARY(@"errorDetail", self.messageErrorDetail);
    SYNOUTPUT_DICTIONARY(@"errorCode", self.messageErrorCode);
    SYNOUTPUT_DICTIONARY(@"userMessage", self.messageUserMessage);
    
    return outputDictionary;
}

+ (RKObjectMapping *) mapping
{
    RKObjectMapping *messageMapping = [RKObjectMapping mappingForClass:[SynMessage class]];
    [messageMapping addAttributeMappingsFromDictionary:@{
                                                         @"errorMessage": @"messageErrorMessage",
                                                         @"errorDetail": @"messageErrorDetail",
                                                         @"errorCode": @"messageErrorCode",
                                                         @"userMessage": @"messageUserMessage",
                                                         }];
    return messageMapping;
}

@end
