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

#define SYNOUTPUT_DICTIONARY(_key, _value)                 \
    if (_value) {                                          \
        [outputDictionary setObject:_value forKey:_key];   \
    }

+ (SynResults *) resultsWithMapping:(NSDictionary *)mappingOptions;

/**
 Initialize a `SynResults` object which handles the mapping between our REST API and the Syndication SDK's objects
 
 If we are mapping a simple single level object, mappingOptions can contain:
 
 "class": The class reference of the containing data object
 "mapping": A NSDictionary of key => value mapping pairs to pass to RestKit
 
 Or if we have a more complex mapping to do, the parent class will handle it and pass us:
 
 "results": An `RKResponseDescriptor` defining our mapping
 
 @param mappingOptions `NSDictionary` containing options defining how the mapping should happen (see below)
 */
//- (id) initWithMapping:(NSDictionary *)mappingOptions; XXX RKJ

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
 @param acceptableKeys `NSArray` of option keys that are valid
 @return An `NSDictionary` containing acceptable parameters to be passed to the Syndication API
 */
- (NSDictionary *) optionsToParameters:(NSDictionary *)options acceptableKeys:(NSArray *)acceptableKeys;

@end
