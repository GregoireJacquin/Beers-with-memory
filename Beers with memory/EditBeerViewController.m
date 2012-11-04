//
//  EditBeerViewController.m
//  Beers with memory
//
//  Created by Carole Pinchedé on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import "EditBeerViewController.h"

@interface EditBeerViewController ()

@end

@implementation EditBeerViewController
@synthesize delegate,name,image,compoistion,nameTextField,navigationBar,choosePhotoButton;

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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 60, 20)];
    label.text = @"Name";
    [self.view addSubview:label];
	// If a name is set, then we must be editing an existing recipe
	if (self.name != nil)
	{
		self.navigationBar.topItem.title = @"Edit Recipe";
		self.nameTextField.text = self.name;
	}
    
	// If the recipe has an image, set it on the button
	if (self.image != nil)
		[self.choosePhotoButton setImage:self.image forState:UIControlStateNormal];
}

- (void)dealloc
{
	[navigationBar release];
	[nameTextField release];
	[choosePhotoButton release];
	[name release];
	[compoistion release];
	[image release];
	[super dealloc];
}

- (IBAction)cancel
{
	// Notify the delegate if it implements the optional method
	if ([self.delegate respondsToSelector:@selector(editRecipeDidCancel:)])
		[self.delegate editBeerDidCancel:self];
    
	[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save
{
	// Make sure the user has entered at least a recipe name
	if (self.nameTextField.text.length == 0)
	{
		UIAlertView* alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Whoops..."
                                  message:@"Please enter a recipe name"
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
		
		[alertView show];
		[alertView release];
		return;
	}
    
	self.name = self.nameTextField.text;
    
	// Notify the delegate and close the screen
	[self.delegate editBeerDidSave:self];
	[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)choosePhoto
{
	imagePicker = [[UIImagePickerController alloc] init];
	imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	imagePicker.delegate = self;
	imagePicker.allowsEditing = YES;
	[self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
	// We get here when the user has successfully picked an image.
	// Put the image in our property and set it on the button.
	self.image = [info objectForKey:UIImagePickerControllerEditedImage];
	[self.choosePhotoButton setImage:self.image forState:UIControlStateNormal];
    
	[self dismissViewControllerAnimated:YES completion:nil];
	[imagePicker release];
	imagePicker = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController*)picker
{
	[self dismissViewControllerAnimated:YES completion:Nil];
	[imagePicker release];
	imagePicker = nil;
}

@end
