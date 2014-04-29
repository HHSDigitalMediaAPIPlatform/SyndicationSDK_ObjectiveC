//
//  SynMediaVideo.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

/**
 Media Video Information */
@interface SynMediaVideo : SynMedia

/// Media Video Youtube Metadata
@property (nonatomic, copy) NSDictionary *mediaYoutubeMetaData;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation;

@end
