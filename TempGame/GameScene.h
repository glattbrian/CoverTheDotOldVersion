//
//  GameScene.h
//  TempGame
//

//  Copyright (c) 2016 Brian Glatt. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameKit/GameKit.h>

@interface GameScene : SKScene
{
    NSSet *currentTouches;
}
-(NSSet*) returnTouches;
@end
