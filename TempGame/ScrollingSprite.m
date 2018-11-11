//
//  ScrollingHorizontalSprite.m
//  Chase The Dot
//
//  Created by Brian Glatt on 9/18/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "ScrollingSprite.h"
#import "MasterController.h"

@implementation ScrollingSprite

-(void)reset
{
    [sequence reset];
    [self positionReset];
}
-(void)positionReset;
{
    [[self getNode] setPosition:CGPointMake(baseXPosition, baseYPosition)];
}
-(BOOL)update
{
    [sprite setTexture:[sequence getImage]];
    [self scrollAction];
    return true;
}
-(id)init:(NSString*) newID startX:(int) startX startY:(int)startY sequenceID:(NSString*)sequenceID
{
    self=[super init:sequenceID];
    hashID=newID;
    baseXPosition=startX;
    baseYPosition=startY;
    return self;
}
-(void)scrollAction
{
    CGPoint point=[[self getNode] position];
    CGSize size=((SKSpriteNode*)[self getNode]).size;
    if(scrollMode==0)
    {
        return;
    }
    else if(scrollMode==1)
    {
        if(point.x>530)
        {
            point=CGPointMake(-screenWidth, baseYPosition);
            [[self getNode] setPosition:point];
        }
        point=CGPointMake(point.x+deltaTime*scoreMultiplier*10, baseYPosition);
    }
    else if(scrollMode==2)
    {
        if(point.x<-screenWidth)
        {
            point=CGPointMake(530, baseYPosition);
            [[self getNode] setPosition:point];
        }
        point=CGPointMake(point.x-deltaTime*scoreMultiplier*10, baseYPosition);
    }
    else if(scrollMode==3)
    {
        
        if(point.y>305)
        {
            point=CGPointMake(baseXPosition, -305);
            [[self getNode] setPosition:point];
        }
        point=CGPointMake(baseXPosition, point.y+deltaTime*scoreMultiplier*10);
    }
    [[self getNode] setPosition:point];
}
@end
