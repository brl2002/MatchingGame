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

SKLabelNode *timeLabel;

float transitionTime = 2.0f;
float timeLeft = 0.0f;

const int gameTime = 30;
int gameTimeLeft = 0;

CFTimeInterval _currentTime = 0;
CFTimeInterval _lastTime = 0;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    gameTimeLeft = gameTime;
    
    SKLabelNode* timeLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
    
    timeLabel.text = @"TIME: ";
    timeLabel.fontSize = 50;
    timeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    timeLabel.fontColor = [SKColor whiteColor];
    timeLabel.position = CGPointMake(self.frame.size.width * 0.01f, self.frame.size.height * 0.65f);
    
    SKAction* updateLabel = [SKAction runBlock:^{
        timeLabel.text = [NSString stringWithFormat:@"TIME: %i", gameTimeLeft];
        --gameTimeLeft;
    }];
    
    SKAction* wait = [SKAction waitForDuration:1.0];
    SKAction* updateLabelAndWait = [SKAction sequence:@[updateLabel, wait]];
    [self runAction:[SKAction repeatAction:updateLabelAndWait count:gameTimeLeft] completion:^{
        timeLabel.text = @"GAME OVER";
    }];
    
    [self addChild:timeLabel];
    
    button = [MatchButton spriteNodeWithImageNamed:@"blue_circle"];
    
    SKTexture* upState = [SKTexture textureWithImageNamed:@"blue_circle"];
    SKTexture* downState = [SKTexture textureWithImageNamed:@"match_item1"];
    
    [button SetTextureForUpState:upState DownState:downState];
    
    SKTexture* matchState = [SKTexture textureWithImageNamed:@"blue_checkmark"];
    SKTexture* notMatchState = [SKTexture textureWithImageNamed:@"blue_cross"];
    
    [button SetTextureForMatchState:matchState NotMatchState:notMatchState];
    
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
    
    if ([node.name isEqualToString:button.name])
    {
        [button SetState:OPEN];
        [self handleButtonClick:button];
    }
}

-(void)handleButtonClick:(MatchButton*)_button
{
    if (selectedButton1 == nil)
    {
        selectedButton1 = _button;
    }
    else if (selectedButton2 == nil)
    {
        selectedButton2 = _button;
    }
}

-(void)onTransitionComplete
{
    [selectedButton1 SetState:CLOSED];
    selectedButton1 = nil;
    selectedButton2 = nil;
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    _lastTime = _currentTime;
    _currentTime = currentTime;
    
    float deltaTime = (float)(_currentTime - _lastTime);
    //gameTimeLeft -= deltaTime;
    
    switch (checkState) {
        case CHECK:
            checkState = CHECK_WAIT;
            break;
            
        case CHECK_WAIT:
            if (timeLeft > 0.0f)
            {
                timeLeft -= deltaTime;
            }
            else
            {
                timeLeft = transitionTime;
                checkState = IDLE;
                
                [self onTransitionComplete];
            }
            break;
            
        case IDLE:
            if (selectedButton1 != nil && selectedButton2 != nil)
            {
                checkState = CHECK;
            }
            break;
    }
    
}

@end
