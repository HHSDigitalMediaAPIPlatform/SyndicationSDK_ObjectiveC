//
//  NSString+Equality.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

/**
 Provides equality additions to the NSString class
 */
@interface NSString (Equality)

/**
 * Returns `YES` if the receiving string is equal to the argument, ignoring case.
 *
 * So `latex` will be equal to `LaTeX` for instance.
 *
 * @param string The string to compare with
 * @return `YES` if the strings are equal. `NO` otherwise.
 */
- (BOOL) isEqualIgnoringCase:(NSString *)string;

@end