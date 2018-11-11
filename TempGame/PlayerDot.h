//
//  PlayerDot.h
//  TempGame
//
//  Created by Brian Glatt on 5/14/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimatedObject.h"

@interface PlayerDot : AnimatedObject
{
    bool active;
    SKNode *movingDotReference;
}

-(id)init:(SKNode*) newMovingDot newID:(NSString*) newId;
-(BOOL)update;

@end
