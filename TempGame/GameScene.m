//
//  GameScene.m
//  TempGame
//
//  Created by Brian Glatt on 5/12/16.
//  Copyright (c) 2016 Brian Glatt. All rights reserved.
//

#import "GameScene.h"
#import "RectangularButton.h"
#import "PlayerDot.h"
#import "MovingDot.h"
#import "BasicText.h"
#import "AnimatedBackground.h"

@implementation GameScene

SKSpriteNode *player;

CGFloat lastUpdateTimeInterval;


-(void)didMoveToView:(SKView *)view
{
    [self setUp];
    [dataLoader loadMenu:@"Splash"];
    //[dataLoader loadMenu:@"Main"];
    [soundManager playMusic:@"Test"];
    /*
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:@"10" forKey:@"temp"];
     
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger favorites = [prefs integerForKey:@"temp"];
    int x=12;
     */
    /*
    movingDot=[[MovingDot alloc] init];
    [objects setObject:movingDot forKey:@"MovingDot"];
    [self addChild:movingDot.getSprite];
    playerDot=[[PlayerDot alloc] init:movingDot.getSprite];
    [objects setObject:playerDot forKey:@"PlayerDot"];
     */
    
    
    
    /*
    player = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    player.xScale = 0.1;
    player.yScale = 0.2;
    player.position=CGPointMake(0, 0);
    */
    /*
    testButton=[buttonTypes objectForKey:@"Temp"];
    
    [testButton.getSprite setSize:CGSizeMake(100, 100)];
    PlayerDot *playerDot=[[PlayerDot alloc] init];
    
    [objects addObject:testButton];
    [objects addObject:playerDot];
    
    BasicText *text=[[BasicText alloc]init:[fonts objectForKey:@"Basic"] text:@"Hello World" point:CGPointMake(100, 100) z:1];
    
    
    [self addChild:testButton.getSprite];
    [self addChild:playerDot.getSprite];
    [self addChild:text.getLabel];
     */
    //[self addChild:player];
}
-(void) setUp
{
    self.anchorPoint=CGPointMake(0.5,0.5);
    self.backgroundColor=[SKColor colorWithRed: 0 green:0 blue:0 alpha:0];
    objects=[[NSMutableDictionary alloc]init];
    uniqueObjects=[[NSMutableDictionary alloc]init];
    activePopUp=[[NSMutableDictionary alloc]init];
    toRemove=[NSMutableArray new];
    toAdd=[[NSMutableDictionary alloc]init];
    labels=[NSMutableArray new];
    animatedBackgrounds=[NSMutableArray new];
    dataLoader=[[DataLoader alloc]init];
    background=[SKSpriteNode spriteNodeWithImageNamed:@"BasicRed"];
    background.size=CGSizeMake(self.size.width, self.size.height);
    background.position=CGPointMake(0, 0);
    background.zPosition=0;
    
    prefs = [NSUserDefaults standardUserDefaults];
    connectionController=[[ConnectionController alloc]init];
    [connectionController isConnected];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    [self createUniqueObjects];
}
-(void)createUniqueObjects
{
    MovingDot *movingDot=[[MovingDot alloc] init:@"MovingDot"];
    [uniqueObjects setObject:movingDot forKey:movingDot.getHashID];
    PlayerDot *playerDot=[[PlayerDot alloc] init:movingDot.getNode newID:@"PlayerDot"];
    [uniqueObjects setObject:playerDot forKey:playerDot.getHashID];
}
-(NSSet*)returnTouches
{
    return currentTouches;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    currentTouches=[event allTouches];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    currentTouches=[event allTouches];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    currentTouches=[event allTouches];
}
-(void)update:(CFTimeInterval)currentTime
{
    /* Called before each frame is rendered */
    deltaTime = currentTime - lastUpdateTimeInterval;
    lastUpdateTimeInterval = currentTime;
    if (deltaTime > 1)
    { // more than a second since last update
        deltaTime = 1.0 / 60.0;
        lastUpdateTimeInterval = currentTime;
    }
    if(!popUpActive)
    {
        [self updateObjects];
    }
    else
    {
        [self updatePopUps];
    }
    [buttonManager eventCalled];
    [self uniqueUpdate];
}
-(void)updatePopUps
{
    for(NSString *key in activePopUp)
    {
        BasicObject *object=activePopUp[key];
        if(![object update])
        {
            [toRemove addObject:key];
        }
    }
    for(NSString *key in toRemove)
    {
        [activePopUp removeObjectForKey:key];
    }
    [toRemove removeAllObjects];
    for(NSString *key in toAdd)
    {
        BasicObject *object=toAdd[key];
        [activePopUp setObject:object forKey:key];
    }
    [toAdd removeAllObjects];
}
-(void)updateObjects
{
    for(NSString *key in objects)
    {
        BasicObject *object=objects[key];
        if(![object update])
        {
            [toRemove addObject:key];
        }
    }
    for(NSString *key in toRemove)
    {
        [objects removeObjectForKey:key];
    }
    [toRemove removeAllObjects];
    for(NSString *key in toAdd)
    {
        BasicObject *object=toAdd[key];
        [objects setObject:object forKey:key];
    }
    [toAdd removeAllObjects];
}
-(void)uniqueUpdate
{
    if(changeAnimatedBackground)
    {
        if(currentAnimatedBackground==newAnimatedBackground)
        {
            changeAnimatedBackground=false;
            return;
        }
        
        [(AnimatedBackground*)animatedBackgrounds[currentAnimatedBackground] removeObjects];
        [(AnimatedBackground*)animatedBackgrounds[newAnimatedBackground] addObjects];
        currentAnimatedBackground=newAnimatedBackground;
        changeAnimatedBackground=false;
    }
}

@end
