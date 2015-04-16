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

MatchData data;

ButtonState buttonState = CLOSED;

NSString* upState = nil;
NSString* downState = nil;
NSString* matchState = nil;
NSString* notMatchState = nil;

-(bool)IsMatchWith:(MatchButton*)button
{
    if (data.ID == button.GetData.ID)
    {
        return true;
    }
    
    return false;
}

-(void)CopyMatchButton:(MatchButton*)button
{
    data.ID = button.GetData.ID;
    upState = button.GetUpState;
    downState = button.GetDownState;
    matchState = button.GetMatchState;
    notMatchState = button.GetNotMatchState;
}

-(void)SetData:(MatchData*)_data
{
    data.ID = _data->ID;
}

-(MatchData)GetData
{
    return data;
}

-(NSString*)GetUpState
{
    return [upState copy];
}

-(NSString*)GetDownState
{
    return [downState copy];
}

-(NSString*)GetMatchState
{
    return [matchState copy];
}

-(NSString*)GetNotMatchState
{
    return [notMatchState copy];
}

-(void)SetTextureForUpState:(NSString*)_upState DownState:(NSString*)_downState
{
    upState = _upState;
    downState = _downState;
}

-(void)SetTextureForMatchState:(NSString*)_matchState NotMatchState:(NSString*)_notMatchState
{
    matchState = _matchState;
    notMatchState = _notMatchState;
}

-(void)SetState:(ButtonState)state
{
    buttonState = state;
    
    switch (buttonState) {
        case OPEN:
            if (downState) {
                self.texture = [SKTexture textureWithImageNamed:downState];
            }
            break;
            
        case CLOSED:
            if (upState) {
                self.texture = [SKTexture textureWithImageNamed:upState];
            }
            break;
            
        case MATCHED:
            if (matchState) {
                self.texture = [SKTexture textureWithImageNamed:matchState];
            }
            break;
            
        case NOT_MATCHED:
            if (notMatchState) {
                self.texture = [SKTexture textureWithImageNamed:notMatchState];
            }
            break;
    }
}

-(ButtonState)GetState
{
    return buttonState;
}

@end