//
//  DataManager.h
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "Constants.h"

@interface DataManager : NSObject
{
    NSDictionary *_apiOptions;                                  // Our API Options
}

+ (DataManager *) sharedDataManager;

@property (nonatomic, copy) NSDictionary *apiOptions;

@end
