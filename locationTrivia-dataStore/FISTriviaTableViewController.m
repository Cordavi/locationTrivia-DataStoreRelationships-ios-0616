//
//  FISTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Michael Amundsen on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISTriviaTableViewController.h"
#import "FISLocation.h"
#import "FISAddTriviaTableViewController.h"

@interface FISTriviaTableViewController ()

@end

@implementation FISTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.accessibilityLabel = @"Trivia Table";
    self.tableView.accessibilityIdentifier = @"Trivia Table";
    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add Trivia Button";
    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"Add Trivia Button";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.location.trivia.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"triviaCell" forIndexPath:indexPath];
    FISTrivium *locationInArray = self.location.trivia[indexPath.row];
    cell.textLabel.text = locationInArray.content;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%li", locationInArray.likes];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    FISAddTriviaTableViewController *triviumAddView = segue.destinationViewController;
    triviumAddView.cellIndex = self.locationIndexPath;
}

@end
