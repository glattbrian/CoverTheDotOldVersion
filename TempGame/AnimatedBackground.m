//
//  AnimatedBackground.m
//  Chase The Dot
//
//  Created by Brian Glatt on 9/16/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "AnimatedBackground.h"
#import "MasterController.h"
#import "BasicObject.h"

@implementation AnimatedBackground

-(void)removeObjects
{
    for(NSString *key in _backgroundObjects)
    {
        BasicObject *object=_backgroundObjects[key];
        [[object getNode] removeFromParent];
        [objects removeObjectForKey:key];
    }
}
-(void)addObjects
{
    for(NSString *key in _backgroundObjects)
    {
        BasicObject *object=_backgroundObjects[key];
        [object reset];
        [game addChild:[object getNode]];
        [objects setObject:object forKey:key];
    }
}
-(id)init
{
    _backgroundObjects=[[NSMutableDictionary alloc]init];
    return self;
}

@end
