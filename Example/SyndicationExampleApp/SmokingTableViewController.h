//
//  SmokingViewController.h
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Syndication/SyndicationSDK.h>

@interface SmokingTableViewController : UITableViewController
{
    SynResults *_results;
    BOOL _loadingMore;
}

@property (nonatomic, strong) NSArray *smokingMedia;

@end
