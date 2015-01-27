//
//  ViewController.h
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"
#import "Boss.h"

@interface ViewController : UIViewController

//instance variables
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) Character *character;
@property (strong, nonatomic) Boss *boss;


//@property (nonatomic) NSInteger health;
//@property (nonatomic) NSInteger damage;
//@property (strong, nonatomic) NSString *weapon;
//@property (strong, nonatomic) NSString *armor;
//@property (strong, nonatomic) NSMutableArray *characterStats;
//@property(nonatomic) NSNumberFormatter *numberFormatter;
//@property (nonatomic) int ActionButtonPressedCount;

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



@end

