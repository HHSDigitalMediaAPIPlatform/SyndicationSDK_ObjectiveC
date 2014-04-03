//
//  SynMediaAlternateImage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynMediaAlternateImage : NSObject

@property (nonatomic, copy) NSNumber *alternateImageId;
@property (nonatomic, copy) NSString *alternateImageName;
@property (nonatomic, copy) NSString *alternateImageUrl;
@property (nonatomic, copy) NSNumber *alternateImageHeight;
@property (nonatomic, copy) NSNumber *alternateImageWidth;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end