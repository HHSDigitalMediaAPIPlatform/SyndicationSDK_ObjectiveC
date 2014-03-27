//
//  SynMediaType.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMediaType.h"

@implementation SynMediaType

- (NSDictionary *) dictionary
{
    return @{
             @"name": self.mediaTypeName,
             @"description": self.mediaTypeDescription,
             };
}

@end