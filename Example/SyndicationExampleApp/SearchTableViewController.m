//
//  SearchTableViewController.m
//  SyndicationExampleApp
//
//  Copyright (c) 2014 CTAC. All rights reserved.
//

#import "SearchTableViewController.h"
#import "SearchDetailViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

@synthesize searchQueue;
@synthesize searchResults;

- (void) awakeFromNib
{
    self.searchResults = [NSMutableArray array];
    self.searchQueue = [NSOperationQueue new];
    [self.searchQueue setMaxConcurrentOperationCount:1];
    _syndication = [Syndication syndication];
}

- (void) didReceiveMemoryWarning
{
    self.searchResults = nil;
    self.searchQueue = nil;
    [super didReceiveMemoryWarning];
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

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 62.0f;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SearchCell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
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

#pragma mark - UISearchDisplayDelegate methods

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    if  (![searchString isEqualToString:@""]) {
        [self.searchQueue cancelAllOperations];
        [self.searchQueue addOperationWithBlock:^{
            [_syndication searchMedia:searchString
                              options:nil
                              success:^(SynMediaResults *mediaResults) {
                                  [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                      _results = mediaResults;
                                      [controller.searchResultsTableView reloadData];
                                  }];
                              }
                              failure:^(SynMediaResults *mediaResults, NSError *error) {
                                  
                              }
             ];
        }];
        return NO;
    } else {
        [self.searchResults removeAllObjects];
        return YES;
    }
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"searchViewDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SearchDetailViewController *destViewController = segue.destinationViewController;
        
        SynMedia *media = (SynMedia *)[_results resultsObjects][indexPath.row];
        destViewController.mediaId = media.mediaId;
    }
}

@end
