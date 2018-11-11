//
//  AnimationSequenceInstance.h
//  TempGame
//
//  Created by Brian Glatt on 5/14/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationSequence.h"
#import "MasterController.h"

@interface AnimationSequenceInstance : NSObject
{
    AnimationSequence *sequence;
    int position;
    CGFloat timePassed;
}

-(SKTexture*) getImage;

-(void)setSequence:(AnimationSequence*) animation;

-(id)init:(NSString*) name;

-(void) reset;


@end
