//
//  Character.h
//  PirateGame
//
//  Created by Babathurpe on 2015-01-26.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject

@property (strong, nonatomic) Armor *armor;
@property (strong, nonatomic) Weapon *weapon;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
