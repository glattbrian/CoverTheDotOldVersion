//
//  SoundManager.m
//  CoverTheHole
//
//  Created by Brian Glatt on 8/31/16.
//  Copyright © 2016 Brian Glatt. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

-(id)init
{
    self=[super init];
    soundEffects=[[NSMutableDictionary alloc]init];
    music=[[NSMutableDictionary alloc]init];
    soundEffectPlayers=[[NSMutableDictionary alloc]init];
    musicPlayers=[[NSMutableDictionary alloc]init];
    activeSounds=[[NSMutableArray alloc]init];
    activeMusic=[[NSMutableArray alloc]init];
    return self;
}
-(void)loadFiles:(NSArray*) text
{
    int numberOfSounds=((NSString*)text[0]).intValue;
    int i;
    for(i=1;i<=numberOfSounds;i++)
    {
        NSArray *data=[text[i]componentsSeparatedByString:@","];
        NSURL *soundFileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",
                                                      [[NSBundle mainBundle] resourcePath], data[1]]];
        AVAudioPlayer *player=[[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                               error:nil];
        player.enableRate=true;
        [soundEffects setObject:soundFileURL forKey:data[0]];
        [soundEffectPlayers setObject:player forKey:data[0]];
    }
    numberOfSounds=((NSString*)text[i]).intValue;
    for(int z=1;z<=numberOfSounds;z++)
    {
        NSArray *data=[text[i+z]componentsSeparatedByString:@","];
        NSURL *soundFileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@",
                                                      [[NSBundle mainBundle] resourcePath], data[1]]];
        AVAudioPlayer *player=[[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL
                                                                     error:nil];
        player.enableRate=true;
        player.numberOfLoops=-1;
        player.volume=0.5;
        [music setObject:soundFileURL forKey:data[0]];
        [musicPlayers setObject:player forKey:data[0]];
    }
}
-(void)playSound:(NSString*) key
{
    if([(AVAudioPlayer*)soundEffectPlayers[key] isPlaying])
    {
        AVAudioPlayer *newPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:soundEffects[key] error:nil];
        [activeSounds addObject:newPlayer];
        newPlayer.delegate=self;
        newPlayer.enableRate=true;
        [newPlayer play];
        return;
    }
    [(AVAudioPlayer*)soundEffectPlayers[key] play];
}
-(void)playMusic:(NSString*) key
{
    if([(AVAudioPlayer*)soundEffectPlayers[key] isPlaying])
    {
        AVAudioPlayer *newPlayer=[[AVAudioPlayer alloc] initWithContentsOfURL:music[key] error:nil];
        [activeMusic addObject:newPlayer];
        newPlayer.numberOfLoops=-1;
        newPlayer.enableRate=true;
        newPlayer.delegate=self;
        [newPlayer play];
        return;
    }
    [(AVAudioPlayer*)musicPlayers[key] play];
}
-(void)endAllMusic
{
    //resetSound
    for(NSString *key in musicPlayers)
    {
        AVAudioPlayer *object=musicPlayers[key];
        if([object isPlaying])
        {
            [object stop];
        }
    }
    for(int i=0;i<[activeMusic count];i++)
    {
        AVAudioPlayer *object=activeMusic[i];
        if([object isPlaying])
        {
            [object stop];
        }
    }
    [activeMusic removeAllObjects];
}
-(void)endAllSounds
{
    //Reset Sound
    for(NSString *key in soundEffectPlayers)
    {
        AVAudioPlayer *object=soundEffectPlayers[key];
        if([object isPlaying])
        {
            [object stop];
        }
    }
    for(int i=0;i<[activeSounds count];i++)
    {
        AVAudioPlayer *object=activeSounds[i];
        if([object isPlaying])
        {
            [object stop];
        }
    }
    [activeSounds removeAllObjects];
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if([activeSounds containsObject:player])
    {
        [activeSounds removeObject:player];
    }
}
-(void)setTempo:(float) tempo
{
    for(NSString *key in musicPlayers)
    {
        AVAudioPlayer *object=musicPlayers[key];
        object.rate=tempo;
    }
    for(NSString *key in soundEffectPlayers)
    {
        AVAudioPlayer *object=soundEffectPlayers[key];
        object.rate=tempo;
    }
    for(int i=0;i<[activeMusic count];i++)
    {
        AVAudioPlayer *object=activeMusic[i];
        object.rate=tempo;
    }
}
@end
