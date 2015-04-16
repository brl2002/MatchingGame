//
//  HelpScene.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-16.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "MenuScene.h"
#import "HelpScene.h"

@implementation HelpScene

- (void)didMoveToView:(SKView *)view
{
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel.text = @"This is a simple matching game.";
    myLabel.fontSize = 35;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame) * 1.7);
    
    [self addChild:myLabel];
    
    SKLabelNode *myLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel2.text = @"Your objective is to match all non-matched";
    myLabel2.fontSize = 35;
    myLabel2.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.5);
    
    [self addChild:myLabel2];
    
    SKLabelNode *myLabel3 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel3.text = @"buttons before the time runs out.";
    myLabel3.fontSize = 35;
    myLabel3.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.3);
    
    [self addChild:myLabel3];
    
    SKLabelNode *myLabel4 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel4.text = @"TOUCH ANYWHERE TO GO BACK";
    myLabel4.fontSize = 35;
    myLabel4.color = [SKColor redColor];
    myLabel4.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.1);
    
    [self addChild:myLabel4];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    MenuScene *menuScene = [[MenuScene alloc] initWithSize:self.size];
    menuScene.scaleMode = SKSceneScaleModeAspectFill;
    SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
    [self.view presentScene:menuScene transition:transition];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)update:(NSTimeInterval)currentTime
{
    
}

@end