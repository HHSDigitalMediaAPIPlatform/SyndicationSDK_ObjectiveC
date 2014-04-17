//
//  SynMediaImage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

/**
 Media Image Information
 */
@interface SynMediaImage : SynMedia

/// Media Image Width
@property (nonatomic, copy) NSNumber *mediaWidth;

/// Media Image Height
@property (nonatomic, copy) NSNumber *mediaHeight;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
