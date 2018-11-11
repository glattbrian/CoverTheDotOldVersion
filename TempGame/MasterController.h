//
//  MasterController.h
//  Ming Photography App
//
//  Created by Brian Glatt on 2/20/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"
#import "GameScene.h"
#import "ButtonManager.h"
#import "DataLoader.h"
#import "FileReader.h"
#import "ConnectionController.h"
#import "SoundManager.h"

@interface MasterController : NSObject

extern CGFloat screenWidth;
extern CGFloat screenHeight;

extern CGFloat lineScaleX;
extern CGFloat lineScaleY;

extern bool popUpActive;
extern bool gameCenterEnabled;
extern bool changeAnimatedBackground;

extern int currentAnimatedBackground;
extern int newAnimatedBackground;

extern int scrollMode;

extern CGFloat deltaTime;

extern CGFloat scoreMultiplier;

extern NSString *animationFile;
extern NSString *buttonFile;
extern NSString *menuFile;
extern NSString *fontFile;
extern NSString *backgroundFile;
extern NSString *popUpFile;
extern NSString *audioFile;
extern NSString *movementNodeFile;
extern NSString *animatedBackgroundFile;

extern NSString *leaderboardIdentifier;

extern int eventCalled;

extern CGFloat score;

extern CGFloat offTime;

extern NSMutableDictionary *buttonTypes;
extern NSMutableDictionary *sequences;
extern NSMutableDictionary *menus;
extern NSMutableDictionary *fonts;
extern NSMutableDictionary *backgrounds;
extern NSMutableDictionary *popUps;


extern NSMutableDictionary *objects;

extern NSMutableDictionary *uniqueObjects;

extern NSMutableDictionary *activePopUp;

extern NSMutableArray *toRemove;
extern NSMutableDictionary *toAdd;
extern NSMutableArray *labels;

extern NSMutableArray *movementMaps;

extern NSMutableArray *animatedBackgrounds;


extern GameScene *game;

extern ButtonManager *buttonManager;

extern DataLoader *dataLoader;

extern FileReader *reader;

extern ConnectionController *connectionController;

extern GameViewController *mainView;

extern SKSpriteNode *background;

extern NSUserDefaults *prefs;

extern SoundManager *soundManager;

@end
