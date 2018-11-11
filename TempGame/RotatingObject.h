//
//  RotatingObject.h
//  Chase The Dot
//
//  Created by Brian Glatt on 9/19/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicAnimation.h"

@interface RotatingObject : BasicAnimation
{
    float currentRotation;
}

-(void)reset;
-(id)init:(NSString*) newID sequenceID:(NSString*)sequenceID;
-(BOOL)update;

@end
