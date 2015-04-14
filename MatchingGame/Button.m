////
////  Button.m
////  MatchingGame
////
////  Created by Minsoo Lee on 2015-04-14.
////  Copyright (c) 2015 Min. All rights reserved.
////
//
//#import "Button.h"
//
//@implementation Button
//
//@synthesize x;
//
//@synthesize y;
//
//@synthesize currentState;
//
//@synthesize downState;
//
//@synthesize upState;
//
//-(void)SetDownState:(SKSpriteNode*)downStateImage
//{
//    downState = downStateImage;
//}
//
//-(void)SetUpState:(SKSpriteNode*)upStateImage
//{
//    upState = upStateImage;
//}
//
//-(void)OnUpState
//{
//    if (upState != nil)
//    {
//        currentState = upState;
//    }
//}
//
//-(void)OnDownState
//{
//    if (downState == nil)
//    {
//        currentState = downState;
//    }
//}
//
//-(void)OnReset
//{
//    if (upState != nil)
//    {
//        currentState = upState;
//    }
//}
//
//-(void)DrawButton:(SKScene*)scene
//{
//    if (currentState != nil)
//    {
//        [scene addChild:currentState];
//        
//        currentState.position = CGPointMake(500, 500);
//    }
//}
//
//-(BOOL) InBounds:(CGPoint)point
//{
//    if (point.x > x && point.x < x + currentState.frame.size.width - 1 &&
//        point.y > y - currentState.frame.size.height && point.y < y - 1)
//    {
//        return true;
//    }
//    else
//    {
//        return false;
//    }
//}
//
//@end
