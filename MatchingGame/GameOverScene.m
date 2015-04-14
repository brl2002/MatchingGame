//
//  GameOverScene.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "GameOverScene.h"
#import "MenuScene.h"

@implementation GameOverScene

- (void)didMoveToView:(SKView *)view
{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"Game Over";
    myLabel.fontSize = 35;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame) * 1.7);
    
    [self addChild:myLabel];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"StartGameButton"])
    {
        MenuScene *gameScene = [[MenuScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
        [self.view presentScene:gameScene transition:transition];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)update:(NSTimeInterval)currentTime
{
    
}

@end
