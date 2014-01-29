//
//  LBELogger.m
//
//  Created by Luis Ascorbe on 29/01/14.
//  Copyright (c) 2014 Luis Ascorbe. All rights reserved.
//

// -- INSTRUCTIONS --
// You MUST install the XcodeColors plugin: https://github.com/robbiehanson/XcodeColors

// How to apply color formatting to your log statements:
//
// To set the foreground color:
// Insert the ESCAPE_SEQ into your string, followed by "fg124,12,255;" where r=124, g=12, b=255.
//
// To set the background color:
// Insert the ESCAPE_SEQ into your string, followed by "bg12,24,36;" where r=12, g=24, b=36.
//
// To reset the foreground color (to default value):
// Insert the ESCAPE_SEQ into your string, followed by "fg;"
//
// To reset the background color (to default value):
// Insert the ESCAPE_SEQ into your string, followed by "bg;"
//
// To reset the foreground and background color (to default values) in one operation:
// Insert the ESCAPE_SEQ into your string, followed by ";"

#import "LBELogger.h"

#define XCODE_COLORS "XcodeColors"
#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

@implementation LBELogger

static BOOL isDebug;
static BOOL showLogs;

+ (void)load
{
#ifdef DEBUG
    showLogs = YES;
    isDebug = YES;
#else
    showLogs = NO;
    isDebug = NO;
#endif
}

+ (void) showLogsOnRelease:(BOOL)showLogsOnRelease
{
    showLogs = showLogsOnRelease;
}

void LBELog(NSString *format, ...)
{
    if (isDebug && showLogs)
    {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args);
    }
}

void LBELogAlways(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSLogv(format, args);
    va_end(args);
}

void LBELogWarning(NSString *format, ...)
{
    if (isDebug && showLogs)
    {
        va_list args;
        va_start(args, format);
        NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        NSLog(XCODE_COLORS_ESCAPE @"fg253,186,9;" @"%@" XCODE_COLORS_RESET, log);
#if !__has_feature(objc_arc)
        [log release];
#endif
    }
}

void LBELogError(NSString *format, ...)
{
    if (isDebug && showLogs)
    {
        va_list args;
        va_start(args, format);
        NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        NSLog(XCODE_COLORS_ESCAPE @"fg220,0,0;" @"%@" XCODE_COLORS_RESET, log);
#if !__has_feature(objc_arc)
        [log release];
#endif
    }
}

void LBELogSuccess(NSString *format, ...)
{
    if (isDebug && showLogs)
    {
        va_list args;
        va_start(args, format);
        NSString *log = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        NSLog(XCODE_COLORS_ESCAPE @"fg104,218,65;" @"%@" XCODE_COLORS_RESET, log);
#if !__has_feature(objc_arc)
        [log release];
#endif
    }
}

@end
