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
    self.currentPoint = CGPointMake(0, 0);
    //NSLog(@"%f %f", self.currentPoint.x, self.currentPoint.y);
    
    //Update Tile to current point at app load - 0,0.
    [self updateTile];
    [self updateButtons];
    [self setCharacterStats];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma ButtonActions

- (IBAction)actionBtnPressed:(UIButton *)sender {
    //Tiles *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    NSString *buttonLabel = self.actionBtn.titleLabel.text;
    
    if([buttonLabel isEqual:@"Take Action"]){
        //Pressing only North Button when game starts
        if(self.currentPoint.x == 0 && self.currentPoint.y == 0){
            [self atTile1];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 0 && self.currentPoint.y == 1){
            [self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 0 && self.currentPoint.y == 2){
            [self atTile3];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        //Pressing only East Button when game starts
        if(self.currentPoint.x == 1 && self.currentPoint.y == 0){
            [self atTile2];
            [self.actionBtn setTitle:@"here" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 1 && self.currentPoint.y == 1){
           //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 1 && self.currentPoint.y == 2){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 2 && self.currentPoint.y == 0){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 2 && self.currentPoint.y == 1){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 2 && self.currentPoint.y == 2){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 3 && self.currentPoint.y == 0){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 3 && self.currentPoint.y == 1){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
        if(self.currentPoint.x == 3 && self.currentPoint.y == 2){
            //[self atTile2];
            [self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
        }
        
    }
    //[self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
    
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
    self.currentPoint = CGPointMake(0, 0);
    [self setCharacterStats];
    //    self.healthLabel.text = @"50";
    //    self.damageLabel.text = @"No Damage";
    //    self.armorLabel.text = @"No Shield";
    //    self.weaponLabel.text = @"No Weapons";
}


//Update tile so the the story can also be updated based on the current tile.
- (void) updateTile{
    Tiles *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    //self.actionBtn.titleLabel.text = tileModel.actionBtnName;
    [self.actionBtn setTitle:@"Take Action" forState:UIControlStateNormal];
}


//Update button visibility to enable users move north, west, south or east
//E.g - If user is at point (0,0) then the west and south button become hidden unless user moves to the north or east.
- (void) updateButtons{
    self.westBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.southBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.northBtn.hidden = [self tileExistsAtPoint: CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
}

- (void) updateActionButton{
    
}

//Set Character Stats when application loads
-(void) setCharacterStats{
    self.healthLabel.text = @"0";
    self.damageLabel.text = @"0";
    self.armorLabel.text = @"Nada";
    self.weaponLabel.text = @"Hands";
}

#pragma Tile Actions

-(void) atTile1{
    [self setCharacterStats];
}

//Method definition for what happens in tile 2
-(void) atTile2{
    self.armorLabel.text = @"Gun Armory";
    int healthNumber = [self.healthLabel.text intValue] + 50;
    NSString *newHealth = [NSString stringWithFormat:@"%d", healthNumber];
    self.healthLabel.text = newHealth;
    self.damageLabel.text = @"0";
    self.weaponLabel.text = @"Guns";
   // Tiles *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    //[self.actionBtn setTitle:@"Action Taken" forState:UIControlStateNormal];
}
//Method definition for what happens in tile 3
-(void) atTile3{
    self.armorLabel.text = @"Shield";
    int healthNumber = [self.healthLabel.text intValue] + 40;
    NSString *newHealth = [NSString stringWithFormat:@"%d", healthNumber];
    self.healthLabel.text = newHealth;
    self.damageLabel.text = @"0";
    self.weaponLabel.text = @"Sword";
}
//Method definition for what happens in tile 4
-(void) atTile4{
    self.armorLabel.text = @"Parrot";
    int healthNumber = [self.healthLabel.text intValue] + 60;
    NSString *newHealth = [NSString stringWithFormat:@"%d", healthNumber];
    self.healthLabel.text = newHealth;
    self.damageLabel.text = @"0";
    NSString *currentWeapon = self.weaponLabel.text;
    if ([currentWeapon isEqual: @"Sword"]) {
        self.weaponLabel.text = @"Guns";
    } else {
        self.weaponLabel.text = @"Knife";
    }
    
}
//Method definition for what happens in tile 5
-(void) atTile5{
    
}
//Method definition for what happens in tile 6
-(void) atTile6{
    
}
//Method definition for what happens in tile 7
-(void) atTile7{
    
}
//Method definition for what happens in tile 8
-(void) atTile8{
    
}
//Method definition for what happens in tile 9
-(void) atTile9{
    
}
//Method definition for what happens in tile 10
-(void) atTile10{
    
}
//Method definition for what happens in tile 11
-(void) atTile11{
    
}
//Method definition for what happens in tile 12
-(void) atTile12{
    
}

//Check to see current point and detemine if user can move north, south, west or east.
- (BOOL) tileExistsAtPoint: (CGPoint) point{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else{
        return YES;
    }
}
@end
