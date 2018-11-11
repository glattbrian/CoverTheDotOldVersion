//
//  BasicSprite.m
//  TempGame
//
//  Created by Brian Glatt on 5/13/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "BasicSprite.h"

@implementation BasicSprite

-(BOOL)update
{
    return true;
}
-(SKSpriteNode*)getSprite
{
    return sprite;
}
-(SKNode*)getNode
{
    return sprite;
}

@end
