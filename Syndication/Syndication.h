//
//  Syndication.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class SynLanguageResults;
@class SynMediaTypeResults;
@class SynMediaResults;
@class SynMediaAlternateImageResults;
@class SynCampaignResults;
@class SynSourceResults;

// Base URL to the Syndication API (this can be overridden)
#define SYNDICATION_DEV_BASE_URL        @"http://ctacdev.com:8090/Syndication"
#define SYNDICAITON_PRODUCTION_BASE_URL @"https://api.hhs.gov/Syndication"
#define SYNDICATION_BASE_URL            SYNDICATION_DEV_BASE_URL

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

+ (Syndication *) syndicationWithOptions:(NSDictionary *)options;
+ (Syndication *) syndication;

///-------------------------------------
/// @name Campaign Request Methods
///-------------------------------------

/**
 Request a page of campaign information from the Syndication API.  Note that you will likely want to use `getCampaignsWithOptions` and pass in your own options to narrow your result and/or paginate.
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynCampaignResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynCampaignResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getCampaigns:(void (^)(SynCampaignResults *campaignResults))success
              failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure;

/**
 Request media information from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
     
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynCampaignResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynCampaignResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getCampaignsWithOptions:(NSDictionary *)options
                         success:(void (^)(SynCampaignResults *campaignResults))success
                         failure:(void (^)(SynCampaignResults *campaignResults, NSError *error))failure;

/**
 Request a specific campaign object from the Syndication API by campaign Id
 
 @param campaignId The campaign Id to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynCampaignResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynCampaignResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getCampaignById:(NSUInteger)campaignId
              success:(void (^)(SynCampaignResults *mediaResults))success
              failure:(void (^)(SynCampaignResults *mediaResults, NSError *error))failure;

///-------------------------------------
/// @name Media Request Methods
///-------------------------------------

/**
 Request a page of media information from the Syndication API.  Note that you will likely want to use `getMediaWithOptions` and pass in your own options to narrow your result and/or paginate.
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMedia:(void (^)(SynMediaResults *mediaResults))success
          failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Request media information from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)

     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
     mediaType:                      Find all media items belonging to the specified media type[s].
     name:                           Find all media items containing the provided name, case insensitive.
     nameContains:                   Find all media items containing the partial name, case insensitive.
     descriptionContains:            Find all media items containing the provided partial description, case insensitive.
     sourceUrl:                      Find all media items which have the provided sourceUrl, case insensitive.
     sourceUrlContains:              Find all media items which contain the provided partial sourceUrl, case insensitive.
     dateContentAuthored:            Find all media items authored on the provided day (RFC 3339, time ignored).
     contentAuthoredSinceDate:       Find all media items authored since the provided day (RFC 3339, time ignored).
     contentAuthoredBeforeDate:      Find all media items authored before the provided day (RFC 3339, time ignored).
     contentAuthoredInRange:         Find all media items authored between the provided start and end days (RFC 3339, comma separated, time ignored).
     dateContentUpdated:             Find all media items updated on the provided day (RFC 3339, time ignored).
     contentUpdatedSinceDate:        Find all media items updated since the provided day (RFC 3339, time ignored).
     contentUpdatedBeforeDate:       Find all media items updated before the provided day (RFC 3339, time ignored).
     contentUpdatededInRange:        Find all media items updated between the provided start and end days (RFC 3339, comma separated, time ignored).
     dateContentPublished:           Find all media items published on the provided day (RFC 3339, time ignored).
     contentPublishedSinceDate:      Find all media items published since the provided day (RFC 3339, time ignored).
     contentPublishedBeforeDate:     Find all media items published before the provided day (RFC 3339, time ignored).
     contentPublishedInRange:        Find all media items published between the provided start and end days (RFC 3339, comma separated, time ignored).
     dateContentReviewed:            Find all media items reviewed on the provided day (RFC 3339, time ignored).
     contentReviewedSinceDate:       Find all media items reviewed since the provided day (RFC 3339, time ignored).
     contentReviewedBeforeDate:      Find all media items reviewed before the provided day (RFC 3339, time ignored).
     contentReviewedInRange:         Find all media items reviewed between the provided start and end days (RFC 3339, comma separated, time ignored).
     dateSyndicationCaptured:        Find all media items authored on the provided day (RFC 3339, time ignored).
     syndicationCapturedSinceDate:   Find all media items authored since the provided day (RFC 3339, time ignored).
     syndicationCapturedBeforeDate:  Find all media items authored before the provided day (RFC 3339, time ignored).
     syndicationCapturedInRange:     Find all media items authored between the provided start and end days (RFC 3339, comma separated, time ignored).
     dateSyndicationUpdated:         Find all media items updated on the provided day, (RFC 3339, time ignored).
     syndicationUpdatedSinceDate:    Find all media items updated since the provided day, (RFC 3339, time ignored).
     syndicationUpdatedBeforeDate:   Find all media items updated before the provided day, (RFC 3339, time ignored).
     syndicationUpdatedInRange:      Find all media items updated between the provided start and end days, (RFC 3339, comma separated, time ignored).
     dateSyndicationVisible:         Find all media items visible on the provided day, (RFC 3339, time ignored).
     syndicationVisibleSinceDate:    Find all media items visible since the provided day, (RFC 3339, time ignored).
     syndicationVisibleBeforeDate:   Find all media items visible before the provided day, (RFC 3339, time ignored).
     syndicationVisibleInRange:      Find all media items visible between the provided start and end days, (RFC 3339, comma separated, time ignored).
     languageId:                     Fnd all media items written in the language specified by Id.
     languageName:                   Find all media items written in the language specified by name, case insensitive.
     languageIsoCode:                Find all media items written in the language specified by 639-2 isoCode , case insensitive.
     hash:                           Find all media items which match the provided hash, case insensitive.
     hashContains:                   Find all media items which match the provided partial hash, case insensitive.
     sourceId:                       Find all media items that belong to the source specified by Id.
     sourceName:                     Find all media items that belong to the source specified by name, case insensitive.
     sourceNameContains:             Find all media items that belong to the source specified by partial name, case insensitive.
     sourceAcronym:                  Find all media items that belong to the source specified by acronym, case insensitive.
     sourceAcronymContains:          Find all media items that belong to the source specified by partial acronym, case insensitive.
     tagIds:                         Find only media items tagged with the specified tag Ids.
     restrictToSet:                  Find only media from within the supplied list of Ids.
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaWithOptions:(NSDictionary *)options
                     success:(void (^)(SynMediaResults *mediaResults))success
                     failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Request the media related to a certain media item.
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaRelatedToMediaId:(NSUInteger)mediaId
                          options:(NSDictionary *)options
                          success:(void (^)(SynMediaResults *mediaResults))success
                          failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;
/**
 Get the media with the highest rankings
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaPopularWithOptions:(NSDictionary *)options
                            success:(void (^)(SynMediaResults *mediaResults))success
                            failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Get a list of media items for a specific campaign based on options.
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
 max:                            The maximum number of records to return
 offset:                         The offset of the records set to return for pagination.
 sort:                           Which field to sort the records by.
 
 @param campaignId The campaign Id to return the media items from
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaByCampaignId:(NSUInteger)campaignId
                      options:(NSDictionary *)options
                      success:(void (^)(SynMediaResults *mediaResults))success
                      failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Request a specific media object from the Syndication API by media ID
 
 @param mediaId The media ID to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaById:(NSUInteger)mediaId
              success:(void (^)(SynMediaResults *mediaResults))success
              failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Search media from the Syndication API by search string
 
 @param searchString The search query to be used
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) searchMedia:(NSString *)searchString
             success:(void (^)(SynMediaResults *mediaResults))success
             failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

/**
 Request the alternate images used by a specific media Id
 
 @param mediaId The media Id to request the alternate images of
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaAlternateImageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaAlternateImageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaAlternateImagesByMediaId:(NSUInteger)mediaId
                                  success:(void (^)(SynMediaAlternateImageResults *mediaResults))success
                                  failure:(void (^)(SynMediaAlternateImageResults *mediaResults, NSError *error))failure;

/**
 Get the content belonging to a given media item
 
 @param mediaId The media item Id to request the content of
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the raw `NSString` which contains the HTML content of the requested media Id
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes one arguments: The `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaContentByMediaId:(NSUInteger)mediaId
                          success:(void (^)(NSString *content))success
                          failure:(void (^)(NSError *error))failure;

/**
 Get the javascript for iframe embed code for this media item for embedding
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     flavor:            Currently supports 'iframe', 'javascript'.  Defaults to 'javascript'
     width:             The width of the generated iframe
     height:            The height of the generated iframe
     iframeName:        The name of the iframe element
     excludeJquery:     Should a reference to the JQuery Library be omitted?
     exludeDiv:         Should the div to insert content into be omitted?
     divId:             Should the div to insert content into have a specific name?
     
 @param mediaId The media Id to request the embed code for
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the raw `NSString` which contains the javascript embed code of the requested media item Id
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes one arguments: The `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaEmbedByMediaId:(NSUInteger)mediaId
                        options:(NSDictionary *)options
                        success:(void (^)(NSString *embedCode))success
                        failure:(void (^)(NSError *error))failure;

/**
 Get the 'like' count for the specified media item.
 
 @param mediaId The media Id to request the like count for
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the raw `NSNumber` which contains the number of likes for this media item
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes one arguments: The `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaRatingByMediaId:(NSUInteger)mediaId
                         success:(void (^)(NSNumber *ratingLikes))success
                         failure:(void (^)(NSError *error))failure;

///-------------------------------------
/// @name Language Request Methods
///-------------------------------------

/**
 Request all language information from the Syndication API
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguages:(void (^)(SynLanguageResults *languages))success
              failure:(void (^)(SynLanguageResults *languages, NSError *error))failure;


/**
 Request languages from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.  
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     SYN_OFFSET:  The offset of the records set to return for pagination (0 based)
     SYN_MAX:     The maximum number of records to return
     SYN_SORT:    The name of the property to which sorting will be applied
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguagesWithOptions:(NSDictionary *)options
                         success:(void (^)(SynLanguageResults *languages))success
                         failure:(void (^)(SynLanguageResults *languages, NSError *error))failure;

/**
 Request a specific language from the Syndication API by language ID
 
 @param languageId The language ID to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynLanguageResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynLanguageResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getLanguageById:(NSUInteger)languageId
                 success:(void (^)(SynLanguageResults *languages))success
                 failure:(void (^)(SynLanguageResults *languages, NSError *error))failure;

///-------------------------------------
/// @name MediaType Request Methods
///-------------------------------------

/**
 Request all mediaType information from the Syndication API
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaTypeResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaTypeResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getMediaTypes:(void (^)(SynMediaTypeResults *mediaTypes))success
               failure:(void (^)(SynMediaTypeResults *mediaTypes, NSError *error))failure;


///-------------------------------------
/// @name Source Request Methods
///-------------------------------------

/**
 Request a page of source information from the Syndication API.  Note that you will likely want to use `getSourcesWithOptions` and pass in your own options to narrow your result and/or paginate.
 
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynSourceResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynSourceResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getSources:(void (^)(SynSourceResults *sourceResults))success
            failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure;

/**
 Request source information from the Syndication API using options
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
 
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynSourceResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynSourceResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getSourcesWithOptions:(NSDictionary *)options
                       success:(void (^)(SynSourceResults *sourceResults))success
                       failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure;

/**
 Request a specific source object from the Syndication API by source Id
 
 @param campaignId The campaign Id to request information about
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynSourceResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynSourceResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) getSourceById:(NSUInteger)sourceId
               success:(void (^)(SynSourceResults *sourceResults))success
               failure:(void (^)(SynSourceResults *sourceResults, NSError *error))failure;

@end
