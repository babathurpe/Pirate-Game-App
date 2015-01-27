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
    Weapon *bluntSword = [[Weapon alloc] init];
    bluntSword.weaponName = @"Blunt Sword";
    bluntSword.damageNumber = 5;
    tile1.weapon = bluntSword;
    tile1.actionBtnName = @"Take Sword";
    
    Tiles *tile2 = [[Tiles alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor? ";
    tile2.backgroundImage = [UIImage imageNamed: @"start-sail.jpg"];
    Armor *newArmor = [[Armor alloc] init];
    newArmor.armorName = @"Amory";
    newArmor.health = 12;
    tile2.armor = newArmor;
    tile2.actionBtnName = @"Take Armor";
    
    Tiles *tile3 = [[Tiles alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed: @"ship1.png"];
    tile3.health = 15;
    tile3.actionBtnName = @"Aye Captain!";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc] init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    Tiles *tile4 = [[Tiles alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are very loyal to their captian and be a great defender in times of need.";
    tile4.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    Armor *parrotArmor = [[Armor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.armorName = @"Parrot";
    tile4.actionBtnName = @"Acquire Parrot";
    
    Tiles *tile5 = [[Tiles alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed: @"pirate-1.jpg"];
    Weapon *pistolWeapon = [[Weapon alloc] init];
    pistolWeapon.weaponName = @"Pistol";
    pistolWeapon.damageNumber = 10;
    tile5.actionBtnName = @"Grab Pistol";
    
    Tiles *tile6 = [[Tiles alloc] init];
    tile6.story = @"You have been captured by other pirates and have been asked to walk the plank!!!";
    tile6.backgroundImage = [UIImage imageNamed: @"rough-sea1.png"];
    tile6.health = -20;
    tile6.actionBtnName = @"Walk Plank";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    Tiles *tile7 = [[Tiles alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    tile7.health = 8;
    tile7.actionBtnName = @"Fight to death!!!";
    
    Tiles *tile8 = [[Tiles alloc] init];
    tile8.story = @"The legend of the deep. The mighty kraken appears.";
    tile8.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    tile8.health = -40;
    tile8.actionBtnName = @"Abandon Ship";
    
    Tiles *tile9 = [[Tiles alloc] init];
    tile9.story = @"You have stumbled upon a hidden cave of pirate treasure.";
    tile9.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    tile9.health = 50;
    tile9.actionBtnName = @"Acquire Treasure";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc] init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    Tiles *tile10 = [[Tiles alloc] init];
    tile10.story = @"Oh no!!! A group of pirates attempt to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed: @"rough-sea.jpg"];
    tile10.health = -15;
    tile10.actionBtnName = @"Fight Scumbags";
    
    Tiles *tile11 = [[Tiles alloc] init];
    tile11.story = @"In the deep of the sea, many things live and can be found. Would this fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed: @"start-sail.jpg"];
    tile11.health = -7;
    tile11.actionBtnName = @"Swim Deeper";
    
    Tiles *tile12 = [[Tiles alloc] init];
    tile12.story = @"Your final battle with the Most Evil Pirate.";
    tile12.backgroundImage = [UIImage imageNamed: @"pirate1.jpg"];
    tile12.health = -15;
    tile12.actionBtnName = @"Fight!!!";
    
    NSMutableArray *forthColumn = [[NSMutableArray alloc] init];
    [forthColumn addObject:tile10];
    [forthColumn addObject:tile11];
    [forthColumn addObject:tile12];
    
    NSArray *storyTiles = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, forthColumn, nil];
    
    return storyTiles;
}

-(Character *) character{
    Character *character = [[Character alloc] init];
    character.health = 50;
    Armor *armor = [[Armor alloc] init];
    armor.armorName = @"Jacket";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.weaponName = @"Hands";
    weapon.damageNumber = 10;
    character.weapon = weapon;
    return character;
}

-(Boss *) boss{
    Boss *boss = [[Boss alloc] init];
    boss.bossHealth = 65;
    return boss;
}

@end
