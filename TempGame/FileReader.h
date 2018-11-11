//
//  FileReader.h
//  TempGame
//
//  Created by Brian Glatt on 5/17/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileReader : NSObject
{
    NSArray *text;
    NSInteger currentLine;
}
-(void) initFile:(NSString*) file;

-(NSArray*) getText;
-(NSString*) getNextLine;
-(NSString*) getCurrentLine;
-(NSInteger) getLineNumber;

@end
