//
//  SynPagination.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@interface SynPagination : NSObject

@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, copy) NSNumber *max;
@property (nonatomic, copy) NSNumber *offset;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSNumber *pageNum;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, copy) NSNumber *total;
@property (nonatomic, copy) NSNumber *totalPages;
@property (nonatomic, copy) NSString *currentUrl;
@property (nonatomic, copy) NSString *nextUrl;
@property (nonatomic, copy) NSString *previousUrl;

- (NSDictionary *) dictionary;

@end
