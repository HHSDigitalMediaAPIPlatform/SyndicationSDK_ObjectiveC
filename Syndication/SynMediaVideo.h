//
//  SynMediaVideo.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

@interface SynMediaVideo : SynMedia

@property (nonatomic, copy) NSDictionary *mediaYoutubeMetaData;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
