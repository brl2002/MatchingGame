//
//  Button.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "Button.h"

@implementation Button

int x = 0;

int y = 0;

SKSpriteNode* currentState = nil;

SKSpriteNode* downState = nil;

SKSpriteNode* upState = nil;

-(void)SetDownState:(SKSpriteNode*)downStateImage
{
    downState = downStateImage;
}

-(void)SetUpState:(SKSpriteNode*)upStateImage
{
    upState = upStateImage;
}

-(void)OnUpState
{
    if (upState != nil)
    {
        currentState = upState;
    }
}

-(void)OnDownState
{
    if (downState == nil)
    {
        currentState = downState;
    }
}

-(void)OnReset
{
    if (upState != nil)
    {
        currentState = upState;
    }
}

-(void)DrawButton:(SKScene*)scene
{
    if (currentState != nil)
    {
        [scene addChild:currentState];
    }
}

-(BOOL) InBounds:(CGPoint)point
{
    if (point.x > x && point.x < x + currentState.frame.size.width - 1 &&
        point.y > y - currentState.frame.size.height && point.y < y - 1)
    {
        return true;
    }
    else
    {
        return false;
    }
}

@end
