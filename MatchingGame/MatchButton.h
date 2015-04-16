//
//  MatchButton.h
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-13.
//  Copyright (c) 2015 Min. All rights reserved.
//

#ifndef MatchingGame_MatchButton_h
#define MatchingGame_MatchButton_h

#import <SpriteKit/SpriteKit.h>

#import "Button.h"

typedef struct MatchData
{
    int ID;
} MatchData;

typedef enum ButtonState
{
    CLOSED,
    OPEN,
    MATCHED,
    NOT_MATCHED
} ButtonState;

@interface MatchButton : SKSpriteNode
{
    MatchData data;
    
    ButtonState buttonState;
    
    NSString* upState;
    NSString* downState;
    NSString* matchState;
    NSString* notMatchState;
}

-(bool)IsMatchWith:(MatchButton*)button;

-(void)CopyMatchButton:(MatchButton*)button;

-(void)SetData:(MatchData*)_data;

-(MatchData)GetData;

-(NSString*)GetUpState;

-(NSString*)GetDownState;

-(NSString*)GetMatchState;

-(NSString*)GetNotMatchState;

-(void)SetState:(ButtonState)state;

-(ButtonState)GetState;

-(void)SetTextureForUpState:(NSString*)_upState DownState:(NSString*)_downState;

-(void)SetTextureForMatchState:(NSString*)_matchState NotMatchState:(NSString*)_notMatchState;

@end

#endif
