//
//  Tiles.h
//  PirateGame
//
//  Created by Babathurpe on 2015-01-14.
//  Copyright (c) 2015 Babathurpe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//Story tiles.
@interface Tiles : NSObject

//Story text
@property (strong, nonatomic) NSString *story;
//background image for each story tile
@property (strong, nonatomic) UIImage *backgroundImage;
//button text for each story tile
@property (strong, nonatomic) NSString *actionBtnName;

@end
