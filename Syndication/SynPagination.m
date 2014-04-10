//
//  SynPagination.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"
#import "SynResults.h"

@implementation SynPagination

- (NSDictionary *) dictionary
{
    NSMutableDictionary *outputDictionary = [NSMutableDictionary dictionary];
    
    SYNOUTPUT_DICTIONARY(@"count", self.count);
    SYNOUTPUT_DICTIONARY(@"max", self.max);
    SYNOUTPUT_DICTIONARY(@"offset", self.offset);
    SYNOUTPUT_DICTIONARY(@"order", self.order);
    SYNOUTPUT_DICTIONARY(@"pageNum", self.pageNum);
    SYNOUTPUT_DICTIONARY(@"sort", self.sort);
    SYNOUTPUT_DICTIONARY(@"total", self.total);
    SYNOUTPUT_DICTIONARY(@"totalPages", self.totalPages);
    SYNOUTPUT_DICTIONARY(@"currentUrl", self.currentUrl);
    SYNOUTPUT_DICTIONARY(@"nextUrl", self.nextUrl);
    SYNOUTPUT_DICTIONARY(@"previousUrl", self.previousUrl);
    
    return outputDictionary;
}

@end
