//
//  SynMediaAlternateImage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Media Alternate Image Information
 */
@interface SynMediaAlternateImage : NSObject

/// Media Alternate Image ID
@property (nonatomic, copy) NSNumber *alternateImageId;

/// Media Alternate Image Name
@property (nonatomic, copy) NSString *alternateImageName;

/// Media Alternate Image URL
@property (nonatomic, copy) NSString *alternateImageUrl;

/// Media Alternate Image Height
@property (nonatomic, copy) NSNumber *alternateImageHeight;

/// Media Alternate Image Width
@property (nonatomic, copy) NSNumber *alternateImageWidth;

/**
 Get a `NSDictionary` representation of this object
 
 @return `NSDictionary` representation of this object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end