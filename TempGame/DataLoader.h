//
//  DataLoader.h
//  TempGame
//
//  Created by Brian Glatt on 5/17/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationSequence.h"

@interface DataLoader : NSObject

-(id)init;
-(void)loadMenu:(NSString*) name;
-(void)loadPopUp:(NSString*) name;

@end
