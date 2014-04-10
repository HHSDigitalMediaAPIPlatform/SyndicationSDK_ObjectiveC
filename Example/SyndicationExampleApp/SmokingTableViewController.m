//
//  SmokingViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import <Syndication/SyndicationSDK.h>

#import "SmokingTableViewController.h"
#import "SmokingDetailViewController.h"

@interface SmokingTableViewController ()

@end

@implementation SmokingTableViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.title = @"Smoking Cessation";
    
    Syndication *syndication = [Syndication syndication];
    
    [syndication searchMedia:@"smoking"
                     options:nil
                     success:^(SynMediaResults *mediaResults) {
                         _results = mediaResults;
                         [self.tableView reloadData];
                     }
                     failure:^(SynMediaResults *mediaResults, NSError *error) {
                         
                     }
     ];
}

#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_results count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SmokingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    SynMedia *media = (SynMedia *)[_results resultsObjects][indexPath.row];
    cell.textLabel.text = media.mediaName;
    cell.detailTextLabel.text = media.mediaDescription;
    
    if (indexPath.row == [_results count] - 1 && !_loadingMore && [_results hasMore]) {
        _loadingMore = TRUE;
        [_results loadMore:^(SynResults *results) {
            _loadingMore = FALSE;
            _results = results;
            [self.tableView reloadData];
        }
                   failure:^(SynResults *results, NSError *error) {
                       // Some error handling can occur here.
                   }
         ];
        
    }
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"smokingViewDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SmokingDetailViewController *destViewController = segue.destinationViewController;
        
        SynMedia *media = (SynMedia *)[_results resultsObjects][indexPath.row];
        destViewController.mediaId = media.mediaId;
    }
}

@end
