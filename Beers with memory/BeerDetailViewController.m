//
//  BeerDetailViewController.m
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import "BeerDetailViewController.h"
#import "DataModel.h"
#import "Beer.h"

@interface BeerDetailViewController ()

@end

@implementation BeerDetailViewController
@synthesize beer,imageView,compositionTextView,dataModel;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = beer.name;
    //UIImage *image = beer.image;
    //[image drawAtPoint:[CGPointMake(50, 100)]];
    self.imageView.image = beer.image;
    self.compositionTextView.text = beer.composition;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
