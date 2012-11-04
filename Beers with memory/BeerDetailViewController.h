//
//  BeerDetailViewController.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Beer;
@class DataModel;

@interface BeerDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextView *compositionTextView;

@property (nonatomic, retain) Beer *beer;
@property (nonatomic, assign) DataModel *dataModel;

@end
