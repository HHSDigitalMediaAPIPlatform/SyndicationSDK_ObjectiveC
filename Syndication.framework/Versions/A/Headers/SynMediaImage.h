//
//  SynMediaImage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SynMedia.h"

@interface SynMediaImage : SynMedia

@property (nonatomic, copy) NSNumber *mediaWidth;
@property (nonatomic, copy) NSNumber *mediaHeight;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
