//
//  DataModel.h
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Beer;
@interface DataModel : NSObject
- (int)beersCount;
- (Beer *)beerAtIndex:(int)index;
- (void)removeBeerAtIndex:(int)index;
@end

