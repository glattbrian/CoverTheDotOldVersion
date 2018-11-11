//
//  AnimatedObject.h
//  TempGame
//
//  Created by Brian Glatt on 5/14/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicSprite.h"
#import "AnimationSequenceInstance.h"

@interface AnimatedObject : BasicSprite
{
    AnimationSequenceInstance *sequence;
}

@end
