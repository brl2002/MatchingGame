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
    
    myLabel.text = @"You are suffering from Posttraumatic Stress";
    myLabel.fontSize = 35;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame) * 1.7);
    
    [self addChild:myLabel];
    
    SKLabelNode *myLabel2 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel2.text = @"Disorder from a tragic car accident that";
    myLabel2.fontSize = 35;
    myLabel2.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.6);
    
    [self addChild:myLabel2];
    
    SKLabelNode *myLabel3 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel3.text = @"you recently had. The disorder puts you";
    myLabel3.fontSize = 35;
    myLabel3.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.5);
    
    [self addChild:myLabel3];
    
    SKLabelNode *myLabel4 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel4.text = @"into a dream where you are stuck inside";
    myLabel4.fontSize = 35;
    myLabel4.color = [SKColor redColor];
    myLabel4.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.4);
    
    [self addChild:myLabel4];
    
    SKLabelNode *myLabel5 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel5.text = @"a world where you need to solve a matching";
    myLabel5.fontSize = 35;
    myLabel5.color = [SKColor redColor];
    myLabel5.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.3);
    
    [self addChild:myLabel5];
    
    SKLabelNode *myLabel6 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel6.text = @"puzzle. So in order to get out of this dream";
    myLabel6.fontSize = 35;
    myLabel6.color = [SKColor redColor];
    myLabel6.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.2);
    
    [self addChild:myLabel6];
    
    SKLabelNode *myLabel7 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel7.text = @"that you randomly have, you need to complete";
    myLabel7.fontSize = 35;
    myLabel7.color = [SKColor redColor];
    myLabel7.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.1);
    
    [self addChild:myLabel7];
    
    SKLabelNode *myLabel8 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel8.text = @"the puzzle by matching all non-matching buttons";
    myLabel8.fontSize = 35;
    myLabel8.color = [SKColor redColor];
    myLabel8.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 1.0);
    
    [self addChild:myLabel8];
    
    SKLabelNode *myLabel9 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel9.text = @"inside your dream. Each puzzle is time limited";
    myLabel9.fontSize = 35;
    myLabel9.color = [SKColor redColor];
    myLabel9.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 0.9);
    
    [self addChild:myLabel9];
    
    SKLabelNode *myLabel10 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel10.text = @"and once the time runs out, you will start";
    myLabel10.fontSize = 35;
    myLabel10.color = [SKColor redColor];
    myLabel10.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 0.8);
    
    [self addChild:myLabel10];
    
    SKLabelNode *myLabel11 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel11.text = @"over to do a new set of puzzle until you";
    myLabel11.fontSize = 35;
    myLabel11.color = [SKColor redColor];
    myLabel11.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame) * 0.7);
    
    [self addChild:myLabel11];
    
    SKLabelNode *myLabel12 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel12.text = @"complete one puzzle.";
    myLabel12.fontSize = 35;
    myLabel12.color = [SKColor redColor];
    myLabel12.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame) * 0.6);
    
    [self addChild:myLabel12];
    
    SKLabelNode *myLabel13 = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    
    myLabel13.text = @"TOUCH SCREEN TO GO BACK";
    myLabel13.fontSize = 35;
    myLabel13.color = [SKColor redColor];
    myLabel13.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame) * 0.3);
    
    [self addChild:myLabel13];
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