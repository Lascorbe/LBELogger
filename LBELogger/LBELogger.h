//
//  LBELogger.h
//
//  Created by Luis Ascorbe on 29/01/14.
//  Copyright (c) 2014 Luis Ascorbe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LBELogger : NSObject

// logs are visible only on Debug, send YES to keep 'em visible always
+ (void) showLogsAlways:(BOOL)showLogsAlways;

void LBELog(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);
void LBELogAlways(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);
void LBELogWarning(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);
void LBELogError(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);
void LBELogSuccess(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

@end
