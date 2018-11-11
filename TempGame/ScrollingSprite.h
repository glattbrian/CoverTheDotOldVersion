//
//  ScrollingHorizontalSprite.h
//  Chase The Dot
//
//  Created by Brian Glatt on 9/18/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicAnimation.h"

@interface ScrollingSprite : BasicAnimation
{
    int baseXPosition;
    int baseYPosition;
}

-(void)reset;
-(id)init:(NSString*) newID startX:(int) startX startY:(int)startY sequenceID:(NSString*)sequenceID;
-(BOOL)update;
@end
