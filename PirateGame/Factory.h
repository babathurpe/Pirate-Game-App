//
//  Factory.h
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"

@interface Factory : NSObject

//Method to return an array of tiles
-(NSArray *) tiles;
-(Character *) character;
-(Boss *) boss;

@end
