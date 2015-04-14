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

enum GameState state = READY;

int oldScore = 0;

NSMutableString* score;

bool showButtons = false;

float showTime = 1.0f;

float _timeLeft = 0.0f;

float gameTime = 60.0f;

float gameTimeLeft = 0.0f;

NSMutableArray* matchButtons;
NSMutableArray* matchList;

MatchButton* firstSelection = nil;
MatchButton* secondSelection = nil;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    matchButtons = [[NSMutableArray alloc] init];
    matchList = [[NSMutableArray alloc]init];
    
    NSMutableArray* placementList = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 30; i++)
    {
        [placementList addObject:[NSNumber numberWithInt:i]];
    }
    
    for (int i = 0; i < placementList.count; i++)
    {
        int randomInt1 = arc4random() % [placementList count];
        int randomInt2 = arc4random() % [placementList count];
        [placementList exchangeObjectAtIndex:randomInt1 withObjectAtIndex:randomInt2];
    }
    
    [MatchButtonFactory Initialize];
    
    int startX = 50;
    int startY = 100;
    
    for (int i = 0; i < 15; i++)
    {
        MatchButton* matchButton = [MatchButtonFactory CreateRandomMatchButton];
        [matchList addObject:matchButton];
    }
    
    for (int i = 0; i < 15; i++)
    {
        MatchButton* matchButton = [MatchButtonFactory CopyExistingMatchButton:matchList[i]];
        [matchList addObject:matchButton];
    }
    
    for (int row = 0; row < 6; row++)
    {
        for (int col = 0; col < 5; col++)
        {
            for (int i = 0; i < 30; i++)
            {
                MatchButton* matchButton = matchList[i];
                matchButton.x = 50 * col + startX;
                matchButton.y = 50 * row + startY;
                
                [matchButtons addObject:matchButton];
                
                //[matchButton DrawButton:self];
                [self addChild:matchButton.upState];
            }
        }
    }
    
    _timeLeft = showTime;
    gameTimeLeft = gameTime;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"match_item1"];
        
        sprite.xScale = 0.5;
        sprite.yScale = 0.5;
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    gameTimeLeft -= currentTime;
    
    if (gameTimeLeft <= 0.0f)
    {
        
    }
}

-(void)ShowButtons
{
    showButtons = true;
    _timeLeft = showTime;
}

-(void)SetGameComplete
{
    if (gameTimeLeft <= 0.0f)
    {
        gameTimeLeft = 0.0f;
    }
    
    oldScore += gameTimeLeft * 5;
    
    GameOverScene *gameScene = [[GameOverScene alloc] initWithSize:self.size];
    SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
    [self.view presentScene:gameScene transition:transition];
}

-(bool)IsGameComplete
{
    for (int i = 0; i < matchButtons.count; i++)
    {
        if ([matchButtons[i] GetState] != MATCHED)
        {
            return false;
        }
    }
    
    return true;
}

-(void)CheckMatch
{
    if ([firstSelection IsMatchWith:secondSelection])
    {
        [firstSelection OnMatch];
        [secondSelection OnMatch];
        
        oldScore += 10;
       [score appendFormat:@"%d", oldScore];
        
        if ([self IsGameComplete])
        {
            [self SetGameComplete];
        }
    }
    else
    {
        [firstSelection OnNotMatch];
        [secondSelection OnNotMatch];
    }
    
    firstSelection = nil;
    secondSelection = nil;
}

@end
