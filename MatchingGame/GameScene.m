//
//  GameScene.m
//  MatchingGame
//
//  Created by Graphic on 2015-04-06.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import "GameScene.h"
#import "MenuScene.h"
#import "MatchButtonFactory.h"
#import "GameOverScene.h"

@implementation GameScene

GameState state = READY;

CheckState checkState = IDLE;

MatchButton* selectedButton1 = nil;
MatchButton* selectedButton2 = nil;

NSMutableArray* matchButtonContainer;

SKLabelNode *timeLabel;
SKLabelNode *scoreLabel;

float transitionTime = 2.0f;
float timeLeft = 2.0f;

const int gameTime = 90;
int gameTimeLeft = 0;

CFTimeInterval _currentTime = 0;
CFTimeInterval _lastTime = 0;

int score;

SKAction* updateLabelAndWait;

bool gameOver = false;

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    gameTimeLeft = gameTime;
    
    timeLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
    
    timeLabel.text = @"TIME: ";
    timeLabel.fontSize = 50;
    timeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    timeLabel.fontColor = [SKColor whiteColor];
    timeLabel.position = CGPointMake(self.frame.size.width * 0.05f, self.frame.size.height * 0.93f);
    
    SKAction* updateLabel = [SKAction runBlock:^{
        timeLabel.text = [NSString stringWithFormat:@"TIME: %i", gameTimeLeft];
        --gameTimeLeft;
    }];
    
    SKAction* wait = [SKAction waitForDuration:1.0];
    updateLabelAndWait = [SKAction sequence:@[updateLabel, wait]];
    [self runAction:[SKAction repeatAction:updateLabelAndWait count:gameTime] completion:^{
        timeLabel.text = @"GAME OVER";
        state = GAMEOVER;
        
        SKSpriteNode* backButton = [SKSpriteNode spriteNodeWithImageNamed:@"blue_sliderLeft"];
        backButton.xScale = 2;
        backButton.yScale = 2;
        backButton.position = CGPointMake(self.frame.size.width * 0.2f, self.frame.size.height * 0.88f);
        backButton.size = CGSizeMake(self.frame.size.width * 0.2f, 40);
        backButton.name = @"BackButton";
        [self addChild:backButton];
        
        SKLabelNode* gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
        
        gameOverLabel.text = @"GAMEOVER!";
        gameOverLabel.fontSize = 50;
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        gameOverLabel.fontColor = [SKColor whiteColor];
        gameOverLabel.position = CGPointMake(self.frame.size.width * 0.3f, self.frame.size.height * 0.5f);
        gameOverLabel.zPosition = 1;
        gameOverLabel.color = [SKColor redColor];
        [self addChild:gameOverLabel];
        
        SKLabelNode* gameOverLabel2 = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
        
        gameOverLabel2.text = @"TOUCH THE SLIDER TOP TO GO BACK";
        gameOverLabel2.fontSize = 50;
        gameOverLabel2.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
        gameOverLabel2.fontColor = [SKColor whiteColor];
        gameOverLabel2.position = CGPointMake(self.frame.size.width * 0.05f, self.frame.size.height * 0.3f);
        gameOverLabel2.color = [SKColor redColor];
        [self addChild:gameOverLabel2];
    }];
    
    [self addChild:timeLabel];
    
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
    
    scoreLabel.text = @"SCORE: ";
    scoreLabel.fontSize = 50;
    scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
    scoreLabel.fontColor = [SKColor whiteColor];
    scoreLabel.position = CGPointMake(self.frame.size.width * 0.65f, self.frame.size.height * 0.93f);
    [self addChild:scoreLabel];
    
    MatchButtonFactory* factory = [MatchButtonFactory alloc];
    [factory Initialize];
    
    matchButtonContainer = [NSMutableArray array];
    
    int numRow = 8;
    int numCol = 8;
    
    for (int i = 0; i < 32; ++i)
    {
        MatchButton* button1 = [factory CreateMatchButton];
        
        button1.xScale = 2;
        button1.yScale = 2;
        
        [matchButtonContainer addObject:button1];
        [self addChild:button1];
        
        MatchButton* button2 = [[MatchButton alloc] initWithImageNamed:@"blue_circle"];
        [button2 CopyMatchButton:button1];
        
        button2.xScale = 2;
        button2.yScale = 2;
        
        [matchButtonContainer addObject:button2];
        [self addChild:button2];
    }
    
    NSUInteger count = matchButtonContainer.count;
    for (NSUInteger i = 0; i < count; ++i)
    {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [matchButtonContainer exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    for (int row = 0; row < numRow; ++row)
    {
        for (int col = 0; col < numCol; ++col)
        {
            int index = row * numCol + col;
            
            MatchButton* button = matchButtonContainer[index];
            button.position = CGPointMake(self.frame.size.width * 0.15f + self.frame.size.width * 0.1f * col,
                                          self.frame.size.height * 0.1f + self.frame.size.height * 0.1f * row);
            button.name = [NSString stringWithFormat:@"button%i", index];
        }
    }
    
    state = RUNNING;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    switch (state) {
        case RUNNING:
            for (MatchButton* button in matchButtonContainer)
            {
                if ([node.name isEqualToString:button.name] &&
                    selectedButton1 != button &&
                    checkState == IDLE &&
                    (button.GetState == CLOSED || button.GetState != MATCHED))
                {
                    [button SetState:OPEN];
                    [self handleButtonClick:button];
                }
            }
            break;
            
        case GAMEOVER:
            if (!gameOver)
            {
                SKSpriteNode* backButton = [SKSpriteNode spriteNodeWithImageNamed:@"blue_sliderLeft"];
                backButton.xScale = 2;
                backButton.yScale = 2;
                backButton.position = CGPointMake(self.frame.size.width * 0.2f, self.frame.size.height * 0.88f);
                backButton.size = CGSizeMake(self.frame.size.width * 0.2f, 40);
                backButton.name = @"BackButton";
                [self addChild:backButton];
                
                SKLabelNode* gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
                
                gameOverLabel.text = @"YOU WON!";
                gameOverLabel.fontSize = 50;
                gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
                gameOverLabel.fontColor = [SKColor whiteColor];
                gameOverLabel.position = CGPointMake(self.frame.size.width * 0.3f, self.frame.size.height * 0.5f);
                gameOverLabel.zPosition = 1;
                gameOverLabel.color = [SKColor redColor];
                [self addChild:gameOverLabel];
                
                SKLabelNode* gameOverLabel2 = [SKLabelNode labelNodeWithFontNamed:@"AppleSDGothicNeo-Regular "];
                
                gameOverLabel2.text = @"TOUCH THE SLIDER TOP TO GO BACK";
                gameOverLabel2.fontSize = 50;
                gameOverLabel2.horizontalAlignmentMode = SKLabelHorizontalAlignmentModeLeft;
                gameOverLabel2.fontColor = [SKColor whiteColor];
                gameOverLabel2.position = CGPointMake(self.frame.size.width * 0.05f, self.frame.size.height * 0.3f);
                gameOverLabel2.color = [SKColor redColor];
                [self addChild:gameOverLabel2];
                
                [self removeAllActions];
                
                gameOver = true;
            }
            
            if ([node.name isEqualToString:@"BackButton"])
            {
                MenuScene *menuScene = [[MenuScene alloc] initWithSize:self.size];
                menuScene.scaleMode = SKSceneScaleModeAspectFill;
                SKTransition *transition = [SKTransition crossFadeWithDuration:0.5];
                [self.view presentScene:menuScene transition:transition];
            }
            break;
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
    [selectedButton2 SetState:CLOSED];
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
            if ([selectedButton1 IsMatchWith:selectedButton2])
            {
                [selectedButton1 SetState:MATCHED];
                [selectedButton2 SetState:MATCHED];
                selectedButton1 = nil;
                selectedButton2 = nil;
                
                scoreLabel.text = [NSString stringWithFormat:@"SCORE: %i", score += 10];
                
                checkState = IDLE;
            }
            else
            {
                checkState = CHECK_WAIT;
            }
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
