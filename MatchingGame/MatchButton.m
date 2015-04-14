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

SKSpriteNode* matchState = nil;

SKSpriteNode* notMatchState = nil;

float timeToWait = 1.0f;

float timeLeft = 0.0f;

-(id)initWithData:(struct MatchData*)_data
{
    self = [super init];
    
    if (self)
    {
        self.data = *_data;
        timeLeft = timeToWait;
    }
    
    return self;
}

-(struct MatchData) GetMatchData
{
    return data;
}

-(bool)IsMatchWith:(MatchButton*)otherButton
{
    return otherButton.data.ID == data.ID;
}

-(enum ButtonState)GetState
{
    return buttonState;
}

-(void)SetMatchState:(SKSpriteNode*)matchState
{
    self.matchState = matchState;
}

-(void)SetNotMatchState:(SKSpriteNode*)notMatchState
{
    self.notMatchState = notMatchState;
}

-(void)ButtonUpdate:(float)deltaTime
{
    if (buttonState == NOT_MATCHED || buttonState == MATCHED)
    {
        timeLeft -= deltaTime;
        
        if (timeLeft <= 0.0f)
        {
            
        }
    }
}

-(void)OnMatch
{
    buttonState = MATCHED;
}

-(void)OnNotMatch
{
    buttonState = NOT_MATCHED;
    timeLeft = timeToWait;
}

-(void)OnUpState
{
    if (buttonState == CLOSED)
    {
        [super OnDownState];
        
        buttonState = OPEN;
    }
}

@end