//
//  GameScene.m
//  MatchingGame
//
//  Created by Graphic on 2015-04-06.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "GameScene.h"
#import "GameOverScene.h"

@implementation GameScene

GameState state = READY;

CheckState checkState = IDLE;

MatchButton* selectedButton1 = nil;
MatchButton* selectedButton2 = nil;

MatchButton* button;

float transitionTime = 2.0f;
float timeLeft = 0.0f;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    button = [SKSpriteNode spriteNodeWithImageNamed:@"blue_circle"];
    
    [button SetTextureForUpState:[SKTexture textureWithImageNamed:@"blue_circle"] DownState:[SKTexture textureWithImageNamed:@"match_item1"]];
    
    [button SetTextureForMatchState:[SKTexture textureWithImageNamed:@"blue_checkmark"] NotMatchState:[SKTexture textureWithImageNamed:@"blue_cross"]];
    
    button.xScale = 2;
    button.yScale = 2;
    button.position = CGPointMake(100, 100);
    button.name = @"button";
    
    [self addChild:button];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"button"])
    {
        [button SetState:OPEN];
    }
}

-(void)onTransitionComplete
{
    [selectedButton1 SetState:CLOSED];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    switch (checkState) {
        case CHECK:
            checkState = CHECK_WAIT;
            break;
            
        case CHECK_WAIT:
            if (timeLeft > 0.0f)
            {
                timeLeft -= currentTime;
            }
            else
            {
                timeLeft = transitionTime;
                checkState = IDLE;
                
                [self onTransitionComplete];
            }
            break;
            
        case IDLE:
            if (selectedButton1 != nil)// && selectedButton2 != nil)
            {
                checkState = CHECK;
            }
            break;
    }
    
}

@end
