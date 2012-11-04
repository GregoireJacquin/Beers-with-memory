//
//  AppDelegate.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeersViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BeersViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;
@end
