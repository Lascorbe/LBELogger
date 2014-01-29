//
//  LBEAppDelegate.m
//  LBELoggerExample
//
//  Created by Luis Ascorbe on 29/01/14.
//  Copyright (c) 2014 Luis Ascorbe. All rights reserved.
//

#import "LBEAppDelegate.h"
#import "LBELogger.h"

@implementation LBEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self logger];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) logger
{
    // LBELogger - By default logs are only shown on Debug
    LBELog(@"This is a normal Log");
    LBELogAlways(@"This log will be shown always, even if it's not a debug version");
    LBELogWarning(@"This is a warning Log");
    LBELogError(@"This is a error Log");
    LBELogSuccess(@"This is a success Log");
    
    // setting this to YES will show logs always
    [LBELogger showLogsOnRelease:YES];
}

@end
