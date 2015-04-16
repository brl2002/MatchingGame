//
//  MatchButtonFactory.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//


#import "MatchButtonFactory.h"

@implementation MatchButtonFactory

NSMutableArray* buttonImageNames;

-(void)Initialize
{
    buttonImageNames = [NSMutableArray array];
    
    [buttonImageNames addObject:@"match_item1"]; // Image 1
    [buttonImageNames addObject:@"match_item2"]; // Image 2
    [buttonImageNames addObject:@"match_item3"]; // Image 3
    [buttonImageNames addObject:@"match_item4"]; // Image 4
    [buttonImageNames addObject:@"match_item5"]; // Image 5
    [buttonImageNames addObject:@"match_item6"]; // Image 6
    [buttonImageNames addObject:@"match_item7"]; // Image 7
    [buttonImageNames addObject:@"match_item8"]; // Image 8
    [buttonImageNames addObject:@"match_item9"]; // Image 9
    [buttonImageNames addObject:@"match_item10"]; // Image 10
    [buttonImageNames addObject:@"match_item11"]; // Image 11
    [buttonImageNames addObject:@"match_item12"]; // Image 12
    [buttonImageNames addObject:@"match_item13"]; // Image 13
    [buttonImageNames addObject:@"match_item14"]; // Image 14
    [buttonImageNames addObject:@"match_item15"]; // Image 15
    [buttonImageNames addObject:@"match_item16"]; // Image 16
    [buttonImageNames addObject:@"match_item17"]; // Image 17
    [buttonImageNames addObject:@"match_item18"]; // Image 18
    [buttonImageNames addObject:@"match_item19"]; // Image 19
    [buttonImageNames addObject:@"match_item20"]; // Image 20
}

-(int)GetRandomIndex
{
    return arc4random_uniform(19);
}

-(MatchButton*)CreateMatchButton
{
    int index = [self GetRandomIndex];
    
    MatchButton* button = [[MatchButton alloc]initWithImageNamed:@"blue_circle"];
    
    [button SetTextureForUpState:@"blue_circle" DownState:buttonImageNames[index]];
    
    [button SetTextureForMatchState:@"blue_checkmark" NotMatchState:@"blue_cross"];
    
    MatchData data;
    data.ID = index;
    
    [button SetData:&data];
    
    return button;
}

@end