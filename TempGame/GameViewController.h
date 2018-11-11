//
//  GameViewController.h
//  TempGame
//

//  Copyright (c) 2016 Brian Glatt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <GameKit/GameKit.h>

@interface GameViewController : UIViewController <GKGameCenterControllerDelegate>

-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard;
-(void)authenticateLocalPlayer;
-(void)reportScore;
-(void)runAd;

@end
