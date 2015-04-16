//
//  MenuScene.m
//  MatchingGame
//
//  Created by Graphic on 2015-04-09.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "MenuScene.h"
#import "HelpScene.h"
#import "GameScene.h"

@implementation MenuScene

- (void)didMoveToView:(SKView *)view
{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Min Matching Game";
    myLabel.fontSize = 35;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame) * 1.7);
    
    [self addChild:myLabel];
    
    SKSpriteNode* startGameButton = [SKSpriteNode spriteNodeWithImageNamed:@"blue_button2"];
    startGameButton.xScale = 2;
    startGameButton.yScale = 2;
    startGameButton.position = CGPointMake(503, 310);
    startGameButton.size = CGSizeMake(190, 49);
    startGameButton.name = @"StartGameButton";
    [self addChild:startGameButton];
    
    SKSpriteNode* helpButton = [SKSpriteNode spriteNodeWithImageNamed:@"blue_button4"];
    helpButton.xScale = 2;
    helpButton.yScale = 2;
    helpButton.position = CGPointMake(503, 203);
    helpButton.size = CGSizeMake(190, 49);
    helpButton.name = @"HelpButton";
    [self addChild:helpButton];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"StartGameButton"])
    {
        GameScene *gameScene = [[GameScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
        [self.view presentScene:gameScene transition:transition];
    }
    else if ([node.name isEqualToString:@"HelpButton"])
    {
        HelpScene *helpScene = [[HelpScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
        [self.view presentScene:helpScene transition:transition];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)update:(NSTimeInterval)currentTime
{
    
}

@end
