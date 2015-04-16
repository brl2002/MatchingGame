//
//  MatchButtonFactory.h
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//

#ifndef MatchingGame_MatchButtonFactory_h
#define MatchingGame_MatchButtonFactory_h

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#import "MatchButton.h"

@interface MatchButtonFactory : NSObject

-(void)Initialize;

-(MatchButton*)CreateMatchButton;

@end

#endif
