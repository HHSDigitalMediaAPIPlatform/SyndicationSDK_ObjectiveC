//
//  SynResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynPagination.h"

@interface SynResults : NSObject
{
    @protected
    id _results;
}

- (id) initWithMapping:(NSDictionary *)mappingOptions;

/**
 Returns an array of dictionaries of the result set requested from the Syndication API
 
 @return An `NSArray` object whose elements are `NSDictionary` representations of the data requested from the Syndication API
 */
- (NSArray *) results;

/**
 Returns an array of objects of the result set requested from the Syndication API
 
 @return An `NSArray` object whose elements are object representations of the data requested from the Syndication API
 */
- (NSArray *) resultsObjects;

/**
 Returns a dictionary of the pagination data requested from the Syndication API
 
 @return An `NSDictionary` object representing the pagination data requested from the Syndication API
 */
- (NSDictionary *) pagination;

/**
 Returns a `SynPagination` object of the pagination data requested from the Syndication API
 
 @return An `SynPagination` object representing the pagination data requested from the Syndication API
 */
- (SynPagination *) paginationObject;

/**
 Filters passed in options into acceptable parameters to be passed to the Syndication API request
 
 @param options `NSDictionary` of options to be filtered into acceptable parameters
 
 @return An `NSDictionary` containing acceptable parameters to be passed to the Syndication API
 */
- (NSDictionary *) optionsToParameters:(NSDictionary *)options;

@end
