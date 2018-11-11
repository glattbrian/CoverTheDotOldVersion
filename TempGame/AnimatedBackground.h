//
//  AnimatedBackground.h
//  Chase The Dot
//
//  Created by Brian Glatt on 9/16/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnimatedBackground : NSObject

@property NSMutableDictionary *backgroundObjects;
    
-(void)removeObjects;
-(void)addObjects;
-(id)init;

@end
