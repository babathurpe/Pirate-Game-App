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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma ButtonActions

- (IBAction)actionBtnPressed:(UIButton *)sender {
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
    self.healthLabel.text = @"50";
    self.damageLabel.text = @"No Damage";
    self.armorLabel.text = @"No Shield";
    self.weaponLabel.text = @"No Weapons";
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

//Check to see current point and detemine if user can move north, south, west or east.
- (BOOL) tileExistsAtPoint: (CGPoint) point{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    } else{
        return YES;
    }
}
@end
