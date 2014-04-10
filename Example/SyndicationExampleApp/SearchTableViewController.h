//
//  SearchTableViewController.h
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Syndication/SyndicationSDK.h>

@interface SearchTableViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
{
    SynResults *_results;
    Syndication *_syndication;
    BOOL _loadingMore;
}

@property (nonatomic, retain) NSOperationQueue *searchQueue;
@property (nonatomic, strong) NSMutableArray *searchResults;

@end
