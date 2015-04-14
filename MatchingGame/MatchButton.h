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

enum ButtonState
{
    CLOSED,
    OPEN,
    MATCHED,
    NOT_MATCHED
};

@interface MatchButton : Button

+(struct MatchData)GetNewMatchData;

@property struct MatchData data;

@property enum ButtonState buttonState;

@property SKSpriteNode* matchState;

@property SKSpriteNode* notMatchState;

@property float timeToWait;

@property float timeLeft;

-(id)initWithData:(struct MatchData*)_data;

-(struct MatchData) GetMatchData;

-(bool)IsMatchWith:(MatchButton*)otherButton;

-(enum ButtonState)GetState;

-(void)SetMatchState:(SKSpriteNode*)matchState;

-(void)SetNotMatchState:(SKSpriteNode*)notMatchState;

-(void)ButtonUpdate:(float)deltaTime;

-(void)OnMatch;

-(void)OnNotMatch;

-(void)OnUpState;

@end

#endif
