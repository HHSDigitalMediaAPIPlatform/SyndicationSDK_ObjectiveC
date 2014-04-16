//
//  SynMediaResults.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynResults.h"

/**
 Results set for the Media request operations.
 */
@interface SynMediaResults : SynResults

+ (SynMediaResults *) mediaResults;

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
 
 @param mediaId The media ID to request information about
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
 
 The options parameter takes a NSDictionary with the following valid keys.
 
 ***IMPORTANT*** the values *MUST* be Objective C objects (eg: @"1" instead of 1)
 
     max:                            The maximum number of records to return
     offset:                         The offset of the records set to return for pagination.
     sort:                           Which field to sort the records by.
 
 @param searchString The search query to be used
 @param options `NSDictionary` containing various options (see Discussion below)
 @param success A block object to be executed when the object request operation finishes successfully.  This block has no return value and takes one argument: the created `SynMediaResults` object that contains the results of the request.
 @param failure A block object to be executed when the request operation finished unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data.  This block has no return value and takes two arguments: the `SynMediaResults` object that was created and the `NSError` object describing the network or parsing error that occurred.
 */
- (void) searchMedia:(NSString *)searchString
             options:(NSDictionary *)options
             success:(void (^)(SynMediaResults *mediaResults))success
             failure:(void (^)(SynMediaResults *mediaResults, NSError *error))failure;

@end
