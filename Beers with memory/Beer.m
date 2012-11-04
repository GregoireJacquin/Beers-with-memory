//
//  Beer.m
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import "Beer.h"

@implementation Beer
@synthesize name,image,composition;
-(void)dealloc
{
    [name release];
    [image release];
    [composition release];
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@",name, composition];
}
@end
