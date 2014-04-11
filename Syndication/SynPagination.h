//
//  SynPagination.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

/**
 Pagination data for this result set
 */
@interface SynPagination : NSObject

/// Number of results returned for this page
@property (nonatomic, copy) NSNumber *count;

/// Maximum number of results returned for this page
@property (nonatomic, copy) NSNumber *max;

/// Record offset of this page of results
@property (nonatomic, copy) NSNumber *offset;

/// Sort order used for this page of results
@property (nonatomic, copy) NSString *order;

/// Page number of this set of results
@property (nonatomic, copy) NSNumber *pageNum;

/// Sort field used for this set of results
@property (nonatomic, copy) NSString *sort;

/// Total number of records in this result set
@property (nonatomic, copy) NSNumber *total;

/// Total number of pages in this result set (based on count/max)
@property (nonatomic, copy) NSNumber *totalPages;

/// URL used to request this result set
@property (nonatomic, copy) NSString *currentUrl;

/// URL for the next page of results in this result set
@property (nonatomic, copy) NSString *nextUrl;

/// URL for the previous page of results in this result set
@property (nonatomic, copy) NSString *previousUrl;

/**
 Returns a `NSDictionary` representation of this pagination object.
 
 @return `NSDictionary` representation of this pagination object
 */
- (NSDictionary *) dictionary;

@end
