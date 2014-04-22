//
//  SynMediaCollection.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

@interface SynMediaCollection : SynMedia

/// Media Items
@property (nonatomic, strong) NSArray *mediaItems;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end