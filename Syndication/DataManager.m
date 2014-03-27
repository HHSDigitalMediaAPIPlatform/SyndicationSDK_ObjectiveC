//
//  DataManager.m
//  Syndication
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

@synthesize apiOptions = _apiOptions;

static DataManager *sharedDataManager;

#pragma mark - init/dealloc

- (id) init
{
    if (self = [super init]) {
        self.apiOptions = [NSDictionary dictionary];
    }
    
    return self;
}

+ (DataManager *) sharedDataManager
{
    if (!sharedDataManager) {
        sharedDataManager = [[DataManager alloc] init];
    }
    
    return sharedDataManager;
}

+ (id) alloc
{
    NSAssert(sharedDataManager == nil, @"Attempted to allocate a second instance of a singleton.");
    sharedDataManager = [super alloc];
    return sharedDataManager;
}

+ (id) copy
{
    NSAssert(sharedDataManager == nil, @"Attempted to copy the singleton.");
    return sharedDataManager;
}

@end
