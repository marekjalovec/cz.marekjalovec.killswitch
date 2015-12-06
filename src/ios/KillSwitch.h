/**
 * Copyright 2015 Marek Jalovec <marek.jalovec@gmail.com>
 *
 * This code is free software. It comes without any warranty,
 * to the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want To
 * Public License, Version 2, as published by Sam Hocevar.
 * See http://www.wtfpl.net/ for more details.
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>
#import "KillSwitchView.h"


@interface KillSwitch : CDVPlugin <KillSwitchViewDelegate>

// properties
@property (nonatomic, copy) NSString *callbackId;

// methods
- (void)start:(CDVInvokedUrlCommand*)command;
- (void)engage:(CDVInvokedUrlCommand*)command;

@end
