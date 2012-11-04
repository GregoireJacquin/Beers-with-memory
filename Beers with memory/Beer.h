//
//  Beer.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *composition;
@property (nonatomic, retain) UIImage *image;

@end
