//
//  Syndication.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class SynLanguages;
@class SynMediaTypes;

// Base URL to the Syndication API (this can be overridden)
#define SYNDICATION_BASE_URL            @"http://ctacdev.com:8090/Syndication"

// This SDK can speak to v2 of the Syndication API
#define SYNDICATION_API_VERSION         @"v2"

// Keys to apiOptions passed to the Syndication SDK init function
#define APIOPT_SYNDICATION_BASE         @"syndication_base"             // Base URL to the API
#define APIOPT_SYNDICATION_URL          @"syndication_url"              // Full URL to the API (normally automatically set)

// Keys to options to be passed into the various request wrappers
#define SYN_OFFSET                      @"offset"
#define SYN_MAX                         @"max"
#define SYN_SORT                        @"sort"

@interface Syndication : NSObject

- (id) initWithOptions:(NSDictionary *)apiOptions;
- (id) initWithURL:(NSString *)URL;

///-------------------------------------
/// @name Language Request Methods
///-------------------------------------

/**
 Request language information from the Syndication API
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguages` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguages` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguages:(void (^)(SynLanguages *languages))success
              failure:(void (^)(SynLanguages *languages, NSError *error))failure;


/**
 Request languages from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.  
 
 ***IMPORTANT*** the values *MUST* be Cocoa objects (eg: @"1" instead of 1)
 
     SYN_OFFSET: The offset of the records set to return for pagination (0 based)
     SYN_MAX: The maximum number of records to return
     SYN_SORT: The name of the property to which sorting will be applied
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguages` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguages` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguages *languages))success
                         failure:(void (^)(SynLanguages *languages, NSError *error))failure;

/**
 Request a specific language from the Syndication API by language ID
 
 @param languageId The language ID to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguages` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguages` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguagesById:(NSUInteger)languageId
                  success:(void (^)(SynLanguages *languages))success
                  failure:(void (^)(SynLanguages *languages, NSError *error))failure;

///-------------------------------------
/// @name MediaType Request Methods
///-------------------------------------

/**
 Request mediaType information from the Syndication API
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaTypes` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaTypes` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaTypes:(void (^)(SynMediaTypes *mediaTypes))success
               failure:(void (^)(SynMediaTypes *mediaTypes, NSError *error))failure;

@end
