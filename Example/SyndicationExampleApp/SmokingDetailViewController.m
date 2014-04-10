//
//  SmokingDetailViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SmokingDetailViewController.h"
#import <Syndication/SyndicationSDK.h>

@interface SmokingDetailViewController ()

@end

@implementation SmokingDetailViewController

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

@end
