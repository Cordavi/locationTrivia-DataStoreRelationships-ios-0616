//
//  FISLocationsTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Michael Amundsen on 6/30/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()
@property (strong, nonatomic) FISLocationsDataStore *store;
@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"addButton";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"addButton";
    self.store = [FISLocationsDataStore sharedLocationsDataStore];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.store.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    FISLocation *locationInArray = self.store.locations[indexPath.row];
    cell.textLabel.text = locationInArray.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", locationInArray.trivia.count];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISTriviaTableViewController *locationSelected = [segue destinationViewController];
    if ([segue.identifier isEqualToString:@"cellSelected"]) {
        NSIndexPath *cellSelected = self.tableView.indexPathForSelectedRow;
        locationSelected.location = self.store.locations[cellSelected.row];
        locationSelected.locationIndexPath = cellSelected;
    }
}

@end
