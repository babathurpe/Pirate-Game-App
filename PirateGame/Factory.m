//
//  Factory.m
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import "Factory.h"
#import "Tiles.h"

@implementation Factory

-(NSArray *) tiles{
    Tiles *tile1 = [[Tiles alloc] init];
    tile1.story = @"Captain, we need a fearless leader such as yourself to undertake this voyage. You must stop the evil pirate Boss. Would you like to start?";
    tile1.backgroundImage = [UIImage imageNamed: @"pirate-1.jpg"];
    
    Tiles *tile2 = [[Tiles alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor? ";
    tile2.backgroundImage = [UIImage imageNamed: @"start-sail.jpg"];
    
    Tiles *tile3 = [[Tiles alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed: @"ship1.png"];
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tiles *tile4 = [[Tiles alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are very loyal to their captian and be a great defender in times of need.";
    tile4.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    
    Tiles *tile5 = [[Tiles alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed: @"pirate-1.jpg"];
    
    Tiles *tile6 = [[Tiles alloc] init];
    tile6.story = @"You have been captured by other pirates and have been asked to walk the plank!!!";
    tile6.backgroundImage = [UIImage imageNamed: @"rough-sea1.png"];
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tiles *tile7 = [[Tiles alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    
    Tiles *tile8 = [[Tiles alloc] init];
    tile8.story = @"The legend of the deep. The mighty kraken appears.";
    tile8.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    
    Tiles *tile9 = [[Tiles alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasure.";
    tile9.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tiles *tile10 = [[Tiles alloc] init];
    tile10.story = @"Oh no!!! A group of pirates attempt to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed: @"rough-sea.jpg"];
    
    Tiles *tile11 = [[Tiles alloc] init];
    tile11.story = @"In the deep of the sea, many things live and can be found. Would this fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed: @"start-sail.jpg"];
    
    Tiles *tile12 = [[Tiles alloc] init];
    tile12.story = @"Your final battle with the Most Evil Pirate.";
    tile12.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    
    NSMutableArray *forthColumn = [[NSMutableArray alloc] init];
    [forthColumn addObject:tile10];
    [forthColumn addObject:tile11];
    [forthColumn addObject:tile12];
    
    NSArray *storyTiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, forthColumn, nil];
    
    return storyTiles;
}

@end
