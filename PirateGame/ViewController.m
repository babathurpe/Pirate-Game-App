//
//  ViewController.m
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import "ViewController.h"
#import "Factory.h"
#import "Tiles.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Factory *factory = [[Factory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    self.currentPoint = CGPointMake(0, 0);
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    
    //Update Tile to current point at app load - 0,0.
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealth:0];
    [self updateTile];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonActions

- (IBAction)actionBtnPressed:(UIButton *)sender {
    Tiles *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if(tile.health == -15){
        self.boss.bossHealth = self.boss.bossHealth - self.character.damage;
    }
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealth:tile.health];
    if(self.character.health <= 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have been killed by the boss. Restart Game." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    } else if (self.boss.bossHealth <= 0){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Won!!" message:@"You defeated the Pirate Boss!!!." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
    [self updateTile];
}


- (IBAction)northBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)westBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)southBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)eastBtnPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateTile];
    [self updateButtons];
}

- (IBAction)resetBtnPressed:(id)sender {
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}


#pragma mark - HelperMethods

//Update tile so the the story can also be updated based on the current tile.
- (void) updateTile{
    Tiles *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.armorName;
    self.weaponLabel.text = self.character.weapon.weaponName;
    [self.actionBtn setTitle:tileModel.actionBtnName forState:UIControlStateNormal];
}


//Update button visibility to enable users move north, west, south or east
//E.g - If user is at point (0,0) then the west and south button become hidden unless user moves to the north or east.
- (void) updateButtons{
    self.westBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.southBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.northBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
}


//Set Character Stats when application loads
-(void) setCharacterStats{
    self.healthLabel.text = @"0";
    self.damageLabel.text = @"0";
    self.armorLabel.text = @"Nada";
    self.weaponLabel.text = @"Hands";
}



//Check to see current point and detemine if user can move north, south, west or east.
- (BOOL) tileExistsAtPoint: (CGPoint) point{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else{
        return YES;
    }
}

- (void) updateCharacterStatsForArmor: (Armor *) armor withWeapons:(Weapon *)weapon withHealth:(int)health {
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    } else if (weapon != nil){
        self.character.damage = self.character.damage - self.character.weapon.damageNumber + weapon.damageNumber;
        self.character.weapon = weapon;
    } else if (health != 0){
        self.character.health = self.character.health + health;
    }else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damageNumber;
    }
}

@end
