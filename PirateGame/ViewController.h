//
//  ViewController.h
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//instance variables
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger damage;
@property (strong, nonatomic) NSString *weapon;
@property (strong, nonatomic) NSString *armor;
@property (strong, nonatomic) NSMutableArray *characterStats;
@property(nonatomic) NSNumberFormatter *numberFormatter;
@property (nonatomic) int ActionButtonPressedCount;

//IBOutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionBtn;
@property (strong, nonatomic) IBOutlet UIButton *northBtn;
@property (strong, nonatomic) IBOutlet UIButton *westBtn;
@property (strong, nonatomic) IBOutlet UIButton *southBtn;
@property (strong, nonatomic) IBOutlet UIButton *eastBtn;

//IBActions
- (IBAction)actionBtnPressed:(UIButton *)sender;
- (IBAction)northBtnPressed:(UIButton *)sender;
- (IBAction)westBtnPressed:(UIButton *)sender;
- (IBAction)southBtnPressed:(UIButton *)sender;
- (IBAction)eastBtnPressed:(UIButton *)sender;
- (IBAction)resetBtnPressed:(id)sender;

//Method to set default character stata
//-(void) setCharacterStats: (int)health damage:(int) damage weapon:(NSString*) weapon armor:(NSString *) armor;
-(void) setCharacterStats;
-(void) atTile2;
-(void) atTile3;
-(void) atTile4;
-(void) atTile5;
-(void) atTile6;
-(void) atTile7;
-(void) atTile8;
-(void) atTile9;
-(void) atTile10;
-(void) atTile11;
-(void) atTile12;


@end

