//
//  HeartDiseaseViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "HeartDiseaseViewController.h"
#import <Syndication/SyndicationSDK.h>

@interface HeartDiseaseViewController ()

@end

@implementation HeartDiseaseViewController

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
