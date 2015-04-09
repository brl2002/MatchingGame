//
//  MenuScene.m
//  MatchingGame
//
//  Created by Graphic on 2015-04-09.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "MenuScene.h"
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
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)update:(NSTimeInterval)currentTime
{
    
}

@end
