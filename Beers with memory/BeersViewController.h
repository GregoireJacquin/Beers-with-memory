//
//  ViewController.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DataModel;

@interface BeersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) DataModel *dataModel;

@end
