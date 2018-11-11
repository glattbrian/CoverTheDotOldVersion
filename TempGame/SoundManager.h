//
//  SoundManager.h
//  CoverTheHole
//
//  Created by Brian Glatt on 8/31/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AudioToolbox/AudioToolbox.h>

#import <AVFoundation/AVFoundation.h>

@interface SoundManager : NSObject <AVAudioPlayerDelegate>
{

    NSMutableDictionary *soundEffects;
    NSMutableDictionary *music;
    NSMutableDictionary *soundEffectPlayers;
    NSMutableDictionary *musicPlayers;
    NSMutableArray *activeSounds;
    NSMutableArray *activeMusic;
}
-(id)init;
-(void)loadFiles:(NSArray*) text;
-(void)playSound:(NSString*) key;
-(void)playMusic:(NSString*) key;
-(void)endAllMusic;
-(void)endAllSounds;
-(void)setTempo:(float) tempo;


@end
