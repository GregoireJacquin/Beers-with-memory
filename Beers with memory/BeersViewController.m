//
//  ViewController.m
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import "BeersViewController.h"
#import "BeerDetailViewController.h"
#import "Beer.h"
#import "EditBeerViewController.h"

@interface BeersViewController ()

@end

@implementation BeersViewController

@synthesize dataModel,table;


- (void)viewDidLoad
{
    self.title = @"Beers";
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBeer)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    [anotherButton release];
    dataModel = [[DataModel alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [dataModel release];
    [table release];
    [super dealloc];
}
#pragma mark - UITableViewDelegate 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataModel beersCount];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    Beer *beer = [dataModel beerAtIndex:indexPath.row];
    cell.textLabel.text = beer.name;
    cell.imageView.image = beer.image;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BeerDetailViewController *controller = [[BeerDetailViewController alloc] init];
    Beer *beer = [dataModel beerAtIndex:indexPath.row];
    controller.beer = beer;
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [dataModel removeBeerAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)addBeer {
    EditBeerViewController *controller = [[EditBeerViewController alloc] init];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
    [controller release];
    
}
-(void)editBeerDidCancel:(EditBeerViewController *)controller
{
    
    
}
-(void)editBeerDidSave:(EditBeerViewController *)controller
{
    Beer *beer = [[Beer alloc] init];
    beer.name = controller.name;
    beer.image = controller.image;
    [self.dataModel addBeer:beer];
    [beer release];
    
    [table reloadData];
}
@end
