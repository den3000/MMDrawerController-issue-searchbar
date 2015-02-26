//
//  ViewController.m
//  MMDrawerController-issue-searchbar
//
//  Created by Denis Suprun on 26/02/15.
//  Copyright (c) 2015 daxh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
-(void) initSearch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    [self initSearch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initSearch{
    mSearchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    mSearchController.searchResultsUpdater = self;
    [mSearchController.searchBar sizeToFit];
    mSearchController.delegate = self;
    mSearchController.dimsBackgroundDuringPresentation = NO; // default is YES
    mSearchController.searchBar.delegate = self; // so we can monitor text changes + others
    
    self.tableView.tableHeaderView = mSearchController.searchBar;
   	self.definesPresentationContext = YES;  // know where you want UISearchController to be displayed
}

#pragma mark - UISearchControllerDelegate

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

@end
