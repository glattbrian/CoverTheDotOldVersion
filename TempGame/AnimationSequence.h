//
//  AnimationSequence.h
//  TempGame
//
//  Created by Brian Glatt on 5/14/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>


@interface AnimationSequence : NSObject
{
    NSMutableArray *images;
    Float32 animationSpeed;
}
-(void)create:(NSInteger) speed;
-(SKTexture*) getImage:(int) position;
-(int) getSpeed;
-(NSMutableArray*) getImages;

@end
