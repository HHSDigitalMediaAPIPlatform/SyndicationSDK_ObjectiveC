//
//  SynMediaHTML.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

/**
 Media HTML Information
 */
@interface SynMediaHTML : SynMedia

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation;

@end