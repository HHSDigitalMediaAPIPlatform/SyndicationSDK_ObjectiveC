//
//  MediaItemByIdViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "MediaItemByIdViewController.h"
#import <Syndication/SyndicationSDK.h>

@interface MediaItemByIdViewController ()

@end

@implementation MediaItemByIdViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    Syndication *syndication = [Syndication syndication];
    
    [syndication getMediaContentByMediaId:1
                                  success:^(NSString *results) {
                                      [self.webView loadHTMLString:results baseURL:nil];
                                  }
                                  failure:^(NSError *error) {
                                      
                                  }
     ];
}

@end
