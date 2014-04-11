//
//  SynResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKMappingResult;

#import "SynPagination.h"

/**
 This class represents a set of result data requested from the Syndication API.  It is the base class for all results coming from the Syndication API.
 
 To get an array of objects in this result set returned from the API, use `resultsObjects`.  To get an array of `NSDictionary` representations of the objects in this result set returned from the API, use `results`.
 */
@interface SynResults : NSObject
{
    @protected
    RKMappingResult *_results;
    NSMutableArray *_resultsArray;
    NSMutableArray *_resultsObjectsArray;
    NSDictionary *_paginationDictionary;
    SynPagination *_paginationObject;
}

#define SYNOUTPUT_DICTIONARY(_key, _value)                 \
    if (_value) {                                          \
        [outputDictionary setObject:_value forKey:_key];   \
    }

/**
 Initialize a `SynResults` object which handles the mapping between our REST API and the Syndication SDK's objects
 
 If we are mapping a simple single level object, mappingOptions can contain:
 
     "class": The class reference of the containing data object
     "mapping": A NSDictionary of key => value mapping pairs to pass to RestKit
 
 Or if we have a more complex mapping to do, the parent class will handle it and pass us:
 
     "results": An `RKResponseDescriptor` defining our mapping
 
 @param mappingOptions `NSDictionary` containing options defining how the mapping should happen (see below)
 */
+ (SynResults *) resultsWithMapping:(NSDictionary *)mappingOptions;

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
 Returns the number of results in this set
 
 @return `NSUInteger` of the number of results in this result set
 */
- (NSUInteger) count;

/**
 Check if the result block has more results to load from the Syndication API
 
 @return `BOOL` If the Syndication API has more results to fetch and return
 */
- (BOOL) hasMore;

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
 @param acceptableKeys `NSArray` of option keys that are valid
 @return An `NSDictionary` containing acceptable parameters to be passed to the Syndication API
 */
- (NSDictionary *) optionsToParameters:(NSDictionary *)options acceptableKeys:(NSArray *)acceptableKeys;

/**
 Load more results into our result set (if any).  Note that after a `loadMore` operation, the result set returned contains all the results returned to this point.  So, each call to `loadMore` will append any new results to the existing result set.
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
*/
- (void) loadMore:(void (^)(SynResults *results))success
          failure:(void (^)(SynResults *results, NSError *error))failure;

/**
 Process an incoming RKMappingResult into the internal format we use for results
 
 @param results `RKMappingResult` of the RestKit results set to process
 */
- (void) handleResults:(RKMappingResult *)results;

@end
