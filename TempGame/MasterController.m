//
//  MasterController.m
//  Ming Photography App
//
//  Created by Brian Glatt on 2/20/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "MasterController.h"

@implementation MasterController

CGFloat screenWidth=0;
CGFloat screenHeight=0;

CGFloat lineScaleX=0;
CGFloat lineScaleY=0;

bool popUpActive=false;

bool gameCenterEnabled=true;

bool changeAnimatedBackground=false;

int currentAnimatedBackground=0;

int newAnimatedBackground=0;

int scrollMode=0;

CGFloat deltaTime=0;

CGFloat scoreMultiplier=1;

NSString *animationFile=@"Sequences";

NSString *buttonFile=@"Buttons";

NSString *menuFile=@"Menus";

NSString *fontFile=@"Fonts";

NSString *backgroundFile=@"Backgrounds";

NSString *popUpFile=@"PopUps";

NSString *audioFile=@"Audio";

NSString *movementNodeFile=@"MovementNodes";

NSString *animatedBackgroundFile=@"AnimatedBackgrounds";

NSString *leaderboardIdentifier=@"";

int eventCalled=-1;

CGFloat score=0;

CGFloat offTime=1;

NSMutableDictionary *buttonTypes;

NSMutableDictionary *sequences;

NSMutableDictionary *menus;

NSMutableDictionary *fonts;

NSMutableDictionary *backgrounds;

NSMutableDictionary *popUps;

NSMutableDictionary *objects;

NSMutableDictionary *uniqueObjects;

NSMutableDictionary *activePopUp;

NSMutableArray *toRemove;
NSMutableDictionary *toAdd;
NSMutableArray *labels;

NSMutableArray *movementMaps;

NSMutableArray *animatedBackgrounds;

const GameScene *game;

const ButtonManager *buttonManager;

const DataLoader *dataLoader;

const FileReader *reader;

const ConnectionController *connectionController;

const GameViewController *mainView;

const SKSpriteNode *background;

const SoundManager *soundManager;

NSUserDefaults *prefs;

@end
