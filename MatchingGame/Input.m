//
//  Input.m
//  MatchingGame
//
//  Created by Minsoo Lee on 2015-04-14.
//  Copyright (c) 2015 Min. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Input.h"

@interface KeyEvent : NSObject

@property int type;

@property int keyCode;

@property char keyChar;

@end

@implementation KeyEvent

static const int KEY_DOWN = 0;

static const int KEY_UP = 1;

int type;

int keyCode;

int keyChar;

-(NSString*)ToString
{
    NSMutableString* eventString = [[NSMutableString alloc]init];
    
    if (type == KEY_DOWN)
    {
        [eventString appendString:@"key down, "];
    }
    else
    {
        [eventString appendString:@"key up, "];
    }
    
    [eventString appendFormat:@"%d", keyCode];
    [eventString appendString:@","];
    [eventString appendFormat:@"%d", keyChar];
        
    return eventString;
}

@end

@interface TouchEvent : NSObject

@property int type;

@property int x, y;

@property int pointer;

@end

@implementation TouchEvent

static const int TOUCH_DOWN = 0;

static const int TOUCH_UP = 1;

static const int TOUCH_DRAGGED = 2;

int type;

int x, y;

int pointer;

-(NSString*)ToString
{
    NSMutableString* eventString = [[NSMutableString alloc]init];
    
    if (type == TOUCH_DOWN)
    {
        [eventString appendString:@"touch down, "];
    }
    else if (type == TOUCH_DRAGGED)
    {
        [eventString appendString:@"touch dragged, "];
    }
    else
    {
        [eventString appendString:@"touch up, "];
    }
    
    [eventString appendFormat:@"%d", pointer];
    [eventString appendString:@","];
    [eventString appendFormat:@"%d", x];
    [eventString appendString:@","];
    [eventString appendFormat:@"%d", y];
    
    return eventString;
}

@end

@implementation Input



@end