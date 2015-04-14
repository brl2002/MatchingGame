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

struct MatchData
{
    int ID;
};

typedef enum ButtonState
{
    CLOSED,
    OPEN,
    MATCHED,
    NOT_MATCHED
} ButtonState;

@interface MatchButton : SKSpriteNode

+(struct MatchData)GetNewMatchData;

-(void)SetState:(ButtonState)state;

-(ButtonState)GetState;

-(void)SetTextureForUpState:(SKTexture*)_upState DownState:(SKTexture*)_downState;

-(void)SetTextureForMatchState:(SKTexture*)_matchState NotMatchState:(SKTexture*)_notMatchState;

@end

#endif
