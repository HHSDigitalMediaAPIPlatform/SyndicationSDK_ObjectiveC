//
//  SynMessage.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

@class RKObjectMapping;

/**
 Message meta data information
 */
@interface SynMessage : NSObject

/// Error mesage string
@property (nonatomic, copy) NSString *messageErrorMessage;

/// Error detail string
@property (nonatomic, copy) NSString *messageErrorDetail;

/// Error code
@property (nonatomic, copy) NSString *messageErrorCode;

/// Error user mesage string
@property (nonatomic, copy) NSString *messageUserMessage;

/**
 Returns a `NSDictionary` representation of this pagination object.
 
 @return `NSDictionary` representation of this pagination object
 */
- (NSDictionary *) dictionary;
+ (RKObjectMapping *) mapping;

@end