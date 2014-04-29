//
//  SynMediaWidget.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

/**
 Media Widget Information
 */
@interface SynMediaWidget : SynMedia

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mappingWithRepresentation:(NSDictionary *)representation;

@end