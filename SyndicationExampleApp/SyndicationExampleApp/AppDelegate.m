//
//  AppDelegate.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "AppDelegate.h"
#import <Syndication/SyndicationSDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
   // Syndication *syn = [Syndication syndicationWithOptions:@{APIOPT_SYNDICATION_URL: @"http://10.10.10.10/~hitman/b.php"}];
    Syndication *syn = [Syndication syndication] ;
                         
/*    [syn getLanguageById:1
                  success:^(SynLanguageResults *results) {
                      NSLog(@"Success: %@", [results results]);
                      NSLog(@"Pagination: %@", [results pagination]);
                      
                  }
                  failure:^(SynLanguageResults *results, NSError *error) {
                      NSLog(@"failure: %@", error);
                      
                  }
     ];*/
   /* [syn getSourceById:1
                          success:^(SynSourceResults *results) {
                              NSLog(@"Success: %@", [results results]);
                              NSLog(@"Pagination: %@", [results pagination]);
                              
                          }
                          failure:^(SynSourceResults *results, NSError *error) {
                              NSLog(@"failure: %@", error);
                              
                          }
     ];*/
    [syn getMediaById:1
                     success:^(SynMediaResults *results) {
                         NSLog(@"%@", [results results]);
                     }
                     failure:^(SynMediaResults *results, NSError *error) {
                         NSLog(@"failure: %@", error);
                         
                     }
     ];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
