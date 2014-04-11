//
//  SearchDetailViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SearchDetailViewController.h"
#import <Syndication/SyndicationSDK.h>

@interface SearchDetailViewController ()

@end

@implementation SearchDetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    Syndication *syndication = [Syndication syndication];
    
    [syndication getMediaContentByMediaId:[self.mediaId intValue]
                                  success:^(NSString *results) {
                                      [self.webView loadHTMLString:results baseURL:nil];
                                  }
                                  failure:^(NSError *error) {
                                      
                                  }
     ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    self.webView = nil;
    self.mediaId = nil;
}

@end