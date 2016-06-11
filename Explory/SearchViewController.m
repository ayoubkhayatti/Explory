//
//  SearchViewController.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "SearchViewController.h"
#import "LocationManager.h"
#import "ConnectionManager.h"
#import "UIColor+Additions.h"
#import "Venue.h"
#import "SearchTableViewCell.h"

NSString *const kCellIdentifier = @"cellId";
NSString *const kShowDetailsSegue = @"showDetailsSegue";

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign, getter=isLoading) BOOL loading;
@property (nonatomic, strong) UISearchController* searchController;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation SearchViewController

#pragma mark - Initialization

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setLayoutMargins:UIEdgeInsetsZero];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.dataSource = [NSArray new];
    self.searchController = [self initializeSearch];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [LocationManager initializeLocationManager];
    [LocationManager startUpdatingLocation];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchTableViewCell *cell;
     if (self.dataSource.count >= indexPath.row) {
         Venue *venue = [self.dataSource objectAtIndex:indexPath.row];
         cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
         [self connfigureCell:cell withVenueObject:venue];
     }
    return cell;
}

- (void)connfigureCell:(SearchTableViewCell*)cell withVenueObject:(Venue*)venue{
    Category *category  = venue.categories[0];
    Location *location  = venue.location;
    NSString *address   = [NSString stringWithFormat:@"Address: %@, %@ %@ %@",
                           location.address,
                           location.postalCode,
                           location.city,
                           location.country];
    
    cell.nameLabel.text = venue.name;
    cell.categoryLabel.text = [NSString stringWithFormat:@"Category: %@",category.name];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%.2f km", (location.distance/1000.0)];
    cell.addressLabel.text  = address;
    cell.verified = venue.verified;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

#pragma mark - Search

- (UISearchController*)initializeSearch
{
    UISearchController *searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.delegate = self;
    searchController.dimsBackgroundDuringPresentation = false;
    searchController.searchBar.placeholder = @"Search around you";
    [searchController.searchBar sizeToFit];
    self.definesPresentationContext = true;
    
    UIView *searchBarView = [[UIView alloc]initWithFrame:searchController.searchBar.frame];
    [searchBarView addSubview:searchController.searchBar];
    self.tableView.tableHeaderView = searchBarView;
    
    //search bar colors
    
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]]
     setTintColor:[UIColor indigoColor]];

    searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchController.searchBar.backgroundColor = [UIColor whiteColor];

    UITextField* textField = [self searchBarTextField:searchController.searchBar];
    if (textField) {
        textField.textColor = [UIColor indigoColor];
        textField.backgroundColor = [UIColor whiteColor];
    }
    
    return searchController;
}

- (UITextField*)searchBarTextField:(UISearchBar*)searchbar
{
    UIView* searchBarView = searchbar.subviews[0];
    
    for (id subview in searchBarView.subviews) {
        if ([subview isKindOfClass:[UITextField class]]) {
            return (UITextField*)subview;
        }
    }
    return nil;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    if ([LocationManager isLocationServicesEnabledAndAllowedToBeUsed]) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(retrieveVenues:)
                                                   object:searchController];
        [self performSelector:@selector(retrieveVenues:) withObject:searchController
                   afterDelay:0.5];
    }
}

#pragma mark - ScrollView Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchController.searchBar resignFirstResponder];
}

#pragma mark - Data

- (void)retrieveVenues:(UISearchController*)searchController{
    self.dataSource = [NSArray new];
    [self.tableView reloadData];

    NSString* keywords = self.searchController.searchBar.text;
    if (keywords.length == 0) {
        return;
    }
    
    [ConnectionManager sendSearchRequest:keywords success:^(NSArray *venues) {
        self.dataSource = venues;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Oops! Something went wrong!"
                                                                                 message:@"The application has encountered an unknown error."
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *accept = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:nil];
        [alertController addAction:accept];
        [self.searchController presentViewController:alertController animated:true completion:nil];
    }];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
