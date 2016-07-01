//
//  FISAddTriviaTableViewController.m
//  locationTrivia-dataStore
//
//  Created by Michael Amundsen on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddTriviaTableViewController.h"
#import "FISLocation.h"
#import "FISLocationsDataStore.h"

@interface FISAddTriviaTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *triviumLabel;

@end

@implementation FISAddTriviaTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitTapped:(id)sender {
    FISTrivium *newTrivium = [[FISTrivium alloc] initWithContent:self.triviumLabel.text likes:0];
    FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
    FISLocation *locationToAddTrivia = dataStore.locations[self.cellIndex.row];
    [locationToAddTrivia.trivia addObject:newTrivium];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
