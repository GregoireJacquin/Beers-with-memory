//
//  ViewController.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "EditBeerViewController.h"

@interface BeersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,EditBeerDelegate>

@property (nonatomic, retain) DataModel *dataModel;
@property (nonatomic, retain) IBOutlet UITableView *table;
- (IBAction)addBeer;
@end
