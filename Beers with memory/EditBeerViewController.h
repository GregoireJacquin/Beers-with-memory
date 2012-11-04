//
//  EditBeerViewController.h
//  Beers with memory
//
//  Created by Carole Pinchedé on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EditBeerViewController;

@protocol EditBeerDelegate <NSObject>

-(void)editBeerDidSave:(EditBeerViewController *)controller;
-(void)editBeerDidCancel:(EditBeerViewController *)controller;

@end

@interface EditBeerViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;
}
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UIButton *choosePhotoButton;

@property (nonatomic, assign) id <EditBeerDelegate> delegate;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *compoistion;
@property (nonatomic, retain) UIImage *image;

-(IBAction)cancel;
-(IBAction)save;
-(IBAction)choosePhoto;
@end
