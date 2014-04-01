//
//  NSString+Equality.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "NSString+Equality.h"

@implementation NSString (Equality)

- (BOOL) isEqualIgnoringCase:(NSString *)string
{
    return [self caseInsensitiveCompare:string] == NSOrderedSame;
}

@end