//
//  MatchButtonFactory.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//


#import "MatchButtonFactory.h"

@implementation MatchButtonFactory

static NSMutableArray* buttonImages;

+(void)Initialize
{
    buttonImages = [[NSMutableArray alloc]init];
    
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item1"]]; // Image 1
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item2"]]; // Image 2
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item3"]]; // Image 3
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item4"]]; // Image 4
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item5"]]; // Image 5
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item6"]]; // Image 6
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item7"]]; // Image 7
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item8"]]; // Image 8
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item9"]]; // Image 9
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item10"]]; // Image 10
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item11"]]; // Image 11
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item12"]]; // Image 12
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item13"]]; // Image 13
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item14"]]; // Image 14
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item15"]]; // Image 15
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item16"]]; // Image 16
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item17"]]; // Image 17
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item18"]]; // Image 18
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item19"]]; // Image 19
    [buttonImages addObject:[SKSpriteNode spriteNodeWithImageNamed:@"match_item20"]]; // Image 20
}

@end