//
//  SynErrors.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <Foundation/Foundation.h>

///---------------------------
/// @name Error Domain & Codes
///---------------------------

// The error domain for Syndication generated errors
extern NSString *const SynErrorDomain;

// The various Syndication generated errors
enum {
    SynGeneralError                             = 5001,     // General error - see userInfo for description
};