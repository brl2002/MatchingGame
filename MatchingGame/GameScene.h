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

#import "MatchButton.h"

typedef enum GameState
{
    READY,
    RUNNING,
    PAUSED,
    GAMEOVER
} GameState;

typedef enum CheckState
{
    IDLE,
    CHECK,
    CHECK_WAIT
} CheckState;

@interface GameScene : SKScene


@end

#endif
