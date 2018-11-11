//
//  GameViewController.m
//  TempGame
//
//  Created by Brian Glatt on 5/12/16.
//  Copyright (c) 2016 Brian Glatt. All rights reserved.
//

@import GoogleMobileAds;

#import "GameViewController.h"
#import "GameScene.h"
#import "MasterController.h"

@interface GameViewController ()

@property(nonatomic, strong) GADInterstitial *interstitial;

@end

@implementation GameViewController

UIViewController *au;
GADRequest *request;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interstitial = [[GADInterstitial alloc] initWithAdUnitID:@""];
    request = [GADRequest request];
    // Requests test ads on test devices.
    request.testDevices = @[kGADSimulatorID];
    [self.interstitial loadRequest:request];
    [self.interstitial loadRequest:request];
    mainView=self;
    [self createScene];
}
-(void)runAd
{
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:self];
    }
}
- (void) createScene
{
    SKView * skView = (SKView *)self.view;
    skView.ignoresSiblingOrder = YES;
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    game=scene;
    buttonManager=[ButtonManager alloc];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    [skView presentScene:scene];
    [self autoAuthenticate];
    //[self authenticateLocalPlayer];
}
-(void)splashTick:(NSTimer *)timer
{
    if ([self.interstitial isReady]) {
        [self.interstitial presentFromRootViewController:self];
    }
    [self performSelector:@selector(splashTick:) withObject:nil afterDelay:0.5];

}
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
-(void)authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error)
    {
        if (viewController != nil)
        {
            [mainView presentViewController:viewController animated:YES completion:nil];
        }
        else
        {
            if ([GKLocalPlayer localPlayer].authenticated)
            {
                gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *thisLeaderboardIdentifier, NSError *error)
                 {
                     
                     if (error != nil)
                     {
                         NSLog(@"%@", [error localizedDescription]);
                     }
                     else
                     {
                         leaderboardIdentifier = thisLeaderboardIdentifier;
                         [self showLeaderboardAndAchievements:YES];
                     }
                 }];
            }
            
            else{
                gameCenterEnabled = NO;
            }
        }
    };
}
-(void)autoAuthenticate
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    
    localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error)
    {
        if (viewController != nil)
        {
            au=viewController;
            [self presentViewController:viewController animated:YES completion:nil];
        }
        else
        {
            if ([GKLocalPlayer localPlayer].authenticated)
            {
                gameCenterEnabled = YES;
                
                // Get the default leaderboard identifier.
                [[GKLocalPlayer localPlayer] loadDefaultLeaderboardIdentifierWithCompletionHandler:^(NSString *thisLeaderboardIdentifier, NSError *error)
                 {
                     
                     if (error != nil)
                     {
                         NSLog(@"%@", [error localizedDescription]);
                     }
                     else
                     {
                         leaderboardIdentifier = thisLeaderboardIdentifier;
                     }
                 }];
            }
            
            else{
                gameCenterEnabled = NO;
            }
        }
    };
}
-(void)showLeaderboardAndAchievements:(BOOL)shouldShowLeaderboard
{
    //Call game center
    if(!gameCenterEnabled&&au!=nil)
    {
        [self presentViewController:au animated:YES completion:nil];
        
        return;
    }
    
    GKGameCenterViewController *gcViewController = [[GKGameCenterViewController alloc] init];
    
    gcViewController.gameCenterDelegate = self;
    
    if (shouldShowLeaderboard) {
        gcViewController.viewState = GKGameCenterViewControllerStateLeaderboards;
        gcViewController.leaderboardIdentifier = leaderboardIdentifier;
    }
    else{
        gcViewController.viewState = GKGameCenterViewControllerStateAchievements;
    }
    
    [self presentViewController:gcViewController animated:YES completion:nil];
    
}

-(void)reportScore
{
    GKScore *scoreS = [[GKScore alloc] initWithLeaderboardIdentifier:leaderboardIdentifier];
    scoreS.value = (int)score;
    
    [GKScore reportScores:@[scoreS] withCompletionHandler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }];
}

#pragma mark - GKGameCenterControllerDelegate method implementation

-(void)gameCenterViewControllerDidFinish:(GKGameCenterViewController *)gameCenterViewController
{
    //testGameCenterEnabled
    //testOnline
    [gameCenterViewController dismissViewControllerAnimated:YES completion:nil];
    gameCenterEnabled = YES;
}

@end
