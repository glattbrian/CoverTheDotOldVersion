//
//  AnimatedBackgroundLoader.m
//  Chase The Dot
//
//  Created by Brian Glatt on 9/16/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "AnimatedBackgroundLoader.h"
#import "AnimatedBackGround.h"
#import "MasterController.h"
#import "BasicText.h"
#import "ScrollingSprite.h"
#import "RotatingObject.h"

@implementation AnimatedBackgroundLoader

AnimatedBackground *animatedbackground;

-(void)loadText
{
    int numberOfTexts=[reader getCurrentLine].intValue;
    for(int i=0;i<numberOfTexts;i++)
    {
        NSArray *data=[[reader getNextLine]componentsSeparatedByString:@","];
        if(((NSString*)data[0]).intValue==0)
        {
            BasicText *text=[[BasicText alloc] init:fonts[data[1]] text:data[2] point:CGPointMake(((NSString*)data[3]).intValue, ((NSString*)data[4]).intValue) z:((NSString*)data[5]).intValue];
            [text setHashID:data[6]];
            [animatedbackground.backgroundObjects setObject:text forKey:data[6]];
            
        }
        else
        {
            //TODO Other Types of Text
        }
    }
    
}
-(void)loadImages
{
    int numberOfImages=[reader getNextLine].intValue;
    for(int i=0;i<numberOfImages;i++)
    {
        NSArray *data=[[reader getNextLine]componentsSeparatedByString:@","];
        if(((NSString*)data[0]).intValue==0)
        {
            BasicAnimation *image=[[BasicAnimation alloc] init:data[7]];
            SKSpriteNode *sprite=[image getSprite];
            [sprite setPosition:CGPointMake(((NSString*)[data objectAtIndex:1]).intValue,((NSString*)[data objectAtIndex:2]).intValue)];
            [sprite setSize:CGSizeMake(((NSString*)[data objectAtIndex:3]).intValue,((NSString*)[data objectAtIndex:4]).intValue)];
            sprite.zPosition=((NSString*)[data objectAtIndex:5]).intValue;
            [image setHashID:[data objectAtIndex:6]];
            [animatedbackground.backgroundObjects setObject:image forKey:data[6]];
            
        }
        else if(((NSString*)data[0]).intValue==1)
        {
            ScrollingSprite *image=[[ScrollingSprite alloc] init:[data objectAtIndex:6] startX:((NSString*)[data objectAtIndex:1]).intValue startY:((NSString*)[data objectAtIndex:2]).intValue sequenceID:[data objectAtIndex:7]];
            SKSpriteNode *sprite=[image getSprite];
            [sprite setPosition:CGPointMake(((NSString*)[data objectAtIndex:1]).intValue,((NSString*)[data objectAtIndex:2]).intValue)];
            [sprite setSize:CGSizeMake(((NSString*)[data objectAtIndex:3]).intValue,((NSString*)[data objectAtIndex:4]).intValue)];
            sprite.zPosition=((NSString*)[data objectAtIndex:5]).intValue;
            [image setHashID:[data objectAtIndex:6]];
            [animatedbackground.backgroundObjects setObject:image forKey:data[6]];
        }
        else if(((NSString*)data[0]).intValue==2)
        {
            RotatingObject *image=[[RotatingObject alloc] init:[data objectAtIndex:6] sequenceID:[data objectAtIndex:7]];
            SKSpriteNode *sprite=[image getSprite];
            [sprite setPosition:CGPointMake(((NSString*)[data objectAtIndex:1]).intValue,((NSString*)[data objectAtIndex:2]).intValue)];
            [sprite setSize:CGSizeMake(((NSString*)[data objectAtIndex:3]).intValue,((NSString*)[data objectAtIndex:4]).intValue)];
            sprite.zPosition=((NSString*)[data objectAtIndex:5]).intValue;
            [image setHashID:[data objectAtIndex:6]];
            [animatedbackground.backgroundObjects setObject:image forKey:data[6]];
        }
        else
        {
            //TODO Other Types of Text
        }
    }
    
}
-(AnimatedBackground*)createAnimatedBackground
{
    animatedbackground=[[AnimatedBackground alloc]init];
    [self loadText];
    [self loadImages];
    return animatedbackground;
}

@end
