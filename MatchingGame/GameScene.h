//
//  GameScene.h
//  MatchingGame
//

//  Copyright (c) 2015 Min. All rights reserved.
//

#ifndef MatchingGame_GameScene_h
#define MatchingGame_GameScene_h

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

#import "MatchButtonFactory.h"

enum GameState
{
    READY,
    RUNNING,
    PAUSED,
    GAMEOVER
};

@interface GameScene : SKScene

@property enum GameState state;

@property int oldScore;

@property NSMutableString* score;

@property bool showButtons;

@property float _timeLeft;

@property float gameTime;

@property float gameTimeLeft;

@property NSMutableArray* matchButton;

@property NSMutableArray* matchList;

@property MatchButton* firstSelection;

@property MatchButton* secondSelection;

@end

#endif
