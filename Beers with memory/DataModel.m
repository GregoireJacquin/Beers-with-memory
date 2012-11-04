//
//  DataModel.m
//  Beers with memory
//
//  Created by Grégoire Jacquin on 04/11/12.
//  Copyright (c) 2012 Grégoire Jacquin. All rights reserved.
//

#import "DataModel.h"
#import "Beer.h"

DataModel* dataModel = nil;

static NSString* const FAVORITES_KEY = @"Favorites";

@interface DataModel ()

@property (nonatomic, retain) NSMutableArray *beers;
@property (nonatomic, retain) NSMutableArray *favorites;

@end

@implementation DataModel
@synthesize beers;
- (id)init
{
    if(self = [super init])
    {
        [self loadBeers];
    }
    return self;
}
+ (void)initialize
{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSArray array],@"Favorites", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dict];
}
-(int)beersCount
{
    return beers.count;    
}
-(Beer *)beerAtIndex:(int)index
{
    return [self.beers objectAtIndex:index];
}
-(void)removeBeerAtIndex:(int)index
{
    [beers removeObjectAtIndex:index];
}
- (void)dealloc
{
    [beers release];
    [super dealloc];
}
-(void)loadBeers
{
    beers = [[[NSMutableArray alloc] initWithCapacity:10] retain];
    
    Beer *beer = [[Beer alloc] init];
    beer.name = @"Allagash";
    beer.composition = @"...";
    beer.image = [UIImage imageNamed:@"beer_allagash_white.jpg"];
    [beers addObject:beer];
    [beer release];
    
    beer = [[Beer alloc] init];
    beer.name = @"Anchor";
    beer.composition = @"...";
    beer.image = [UIImage imageNamed:@"beer_anchor_christmas.jpg"];
    [beers addObject:beer];
    [beer release];
    
    beer = [[Beer alloc] init];
    beer.name = @"Anchor steam";
    beer.composition = @"...";
    beer.image = [UIImage imageNamed:@"beer_anchor_steam.jpg"];
    [beers addObject:beer];
    [beer release];
    
}
- (Beer *)findBeerNamed:(NSString*)name
{
	for (Beer *beer in self.beers)
	{
		if ([beer.name isEqualToString:name])
			return beer;
	}
	return nil;
}

- (int)favoritesCount
{
	return self.favorites.count;
}

- (Beer *)favoriteAtIndex:(int)index
{
	NSString *name = [self.favorites objectAtIndex:index];
	return [self findBeerNamed:name];
}

- (BOOL)isFavorite:(Beer *)beer
{
	return [self.favorites containsObject:beer.name];
}

- (void)addToFavorites:(Beer *)beer
{
	[self.favorites addObject:beer.name];
	[[NSUserDefaults standardUserDefaults] setObject:self.favorites forKey:FAVORITES_KEY];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)removeFromFavorites:(Beer *)recipe
{
	[self.favorites removeObject:recipe.name];
	[[NSUserDefaults standardUserDefaults] setObject:self.favorites forKey:FAVORITES_KEY];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
