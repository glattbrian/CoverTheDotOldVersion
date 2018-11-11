//
//  BasicSprite.h
//  TempGame
//
//  Created by Brian Glatt on 5/13/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "BasicObject.h"

@interface BasicSprite : BasicObject
{
    SKSpriteNode *sprite;
}
-(SKNode*)getNode;
-(SKSpriteNode*)getSprite;


@end
