//
//  SynPagination.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"

@implementation SynPagination

- (NSDictionary *) dictionary
{
    return @{
             @"count": self.count,
             @"max": self.max,
             @"offset": self.offset,
             @"order": self.order,
             @"pageNum": self.pageNum,
             @"sort": self.sort,
             @"total": self.total,
             @"totalPages": self.totalPages,
             };
}

@end
