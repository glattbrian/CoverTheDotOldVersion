//
//  MenuLoader.h
//  TempGame
//
//  Created by Brian Glatt on 5/29/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuObject.h"

@interface MenuLoader : NSObject

-(void)loadMenu;

-(MenuObject*)createMenu;


@end
