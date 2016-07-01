//
//  FISTriviaTableViewController.h
//  locationTrivia-dataStore
//
//  Created by Michael Amundsen on 7/1/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISLocation.h"

@interface FISTriviaTableViewController : UITableViewController
@property (strong, nonatomic) FISLocation *location;
@property (strong, nonatomic) NSIndexPath *locationIndexPath;

@end
