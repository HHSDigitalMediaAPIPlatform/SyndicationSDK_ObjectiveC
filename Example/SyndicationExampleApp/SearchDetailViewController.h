//
//  SearchDetailViewController.h
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSNumber *mediaId;

@end