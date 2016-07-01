//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Michael Amundsen on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataStore.h"
#import "FISLocation.h"

@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *latitudeLabel;
@property (weak, nonatomic) IBOutlet UITextField *longitudeLabel;
@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveTapped:(id)sender {
    FISLocation *locationToAdd = [[FISLocation alloc] initWithName:self.nameLabel.text latitude:[self.latitudeLabel.text floatValue] longitude:[self.longitudeLabel.text floatValue]];
    FISLocationsDataStore *dataStore = [FISLocationsDataStore sharedLocationsDataStore];
    [dataStore.locations addObject:locationToAdd];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
