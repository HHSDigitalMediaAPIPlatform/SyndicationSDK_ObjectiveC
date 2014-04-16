//
//  SynMediaType.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

@interface SynMediaType : NSObject

@property (nonatomic, copy) NSString *mediaTypeName;
@property (nonatomic, copy) NSString *mediaTypeDescription;

- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end
