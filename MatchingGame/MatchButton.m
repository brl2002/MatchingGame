//
//  MatchButton.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-13.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MatchButton.h"

@implementation MatchButton

static int lastAssignedID;

+(struct MatchData) GetNewMatchData
{
    struct MatchData newData;
    newData.ID++;
    return newData;
}

struct MatchData data;

enum ButtonState buttonState = CLOSED;

SKTexture* upState;
SKTexture* downState;
SKTexture* matchState;
SKTexture* notMatchState;

-(void)SetTextureForUpState:(SKTexture*)_upState DownState:(SKTexture*)_downState
{
    upState = _upState;
    downState = _downState;
}

-(void)SetTextureForMatchState:(SKTexture*)_matchState NotMatchState:(SKTexture*)_notMatchState
{
    matchState = _matchState;
    notMatchState = _notMatchState;
}

-(void)SetState:(ButtonState)state
{
    buttonState = state;
    
    switch (buttonState) {
        case OPEN:
            if (upState) {
                self.texture = upState;
            }
            break;
            
        case CLOSED:
            if (downState) {
                self.texture = downState;
            }
            break;
            
        case MATCHED:
            if (matchState) {
                self.texture = matchState;
            }
            break;
            
        case NOT_MATCHED:
            if (notMatchState) {
                self.texture = notMatchState;
            }
            break;
    }
}

-(ButtonState)GetState
{
    return buttonState;
}

@end