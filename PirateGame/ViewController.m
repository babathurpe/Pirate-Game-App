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
    if(self.currentPoint.x == 0 && self.currentPoint.y ==1 ){
        [self atTile2];
    }
        
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
        self.healthLabel.text = @"50";
        self.damageLabel.text = @"0";
        self.armorLabel.text = @"Coat";
        self.weaponLabel.text = @"Hands";
}

#pragma Tile Actions

//Method definition for what happens in tile 2
-(void) atTile2{
    self.armorLabel.text = @"Gun Armory";
    self.healthLabel.text = @"100";
    self.damageLabel.text = @"0";
    self.weaponLabel.text = @"Hands";
}
//Method definition for what happens in tile 3
-(void) atTile3{
    
}
//Method definition for what happens in tile 4
-(void) atTile4{
    
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
