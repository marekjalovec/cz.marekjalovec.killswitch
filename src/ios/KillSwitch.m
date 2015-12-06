/**
 * Copyright 2015 Marek Jalovec <marek.jalovec@gmail.com>
 *
 * This code is free software. It comes without any warranty,
 * to the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want To
 * Public License, Version 2, as published by Sam Hocevar.
 * See http://www.wtfpl.net/ for more details.
 */

#import "KillSwitch.h"
#import "AppDelegate.h"


@implementation KillSwitch

/**
 * Register for notifications
 */
- (void)start:(CDVInvokedUrlCommand*)command;
{
    self.callbackId = command.callbackId;
    
    // add KillSwitchView to the app
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    UIView *rootView = appDelegate.viewController.view;
    KillSwitchView *killSwitchView = [[KillSwitchView alloc] initWithFrame:CGRectMake(50, rootView.frame.size.height - 100, 50, 50) delegate:self];
    [rootView addSubview:killSwitchView];
    
    // respond to the javascript
    [self successWithMessage:@"OK"];
}

/**
 * Engage the command directly
 */
- (void)engage:(CDVInvokedUrlCommand*)command
{
    [self killApp];
}

/**
 * Terminate the application
 */
- (void)killApp
{
    exit(0);
}

/**
 * Report success for current command
 */
-(void)successWithMessage:(NSString *)message
{
    if (self.callbackId != nil) {
        CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:message];

        [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
    }
}

/**
 * Report fail for current command
 */
-(void)failWithMessage:(NSString *)message withError:(NSError *)error
{
    if (self.callbackId != nil) {
        NSString *errorMessage = error ? [NSString stringWithFormat:@"%@ - %@", message, [error localizedDescription]] : message;
        CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errorMessage];
        
        [self.commandDelegate sendPluginResult:commandResult callbackId:self.callbackId];
    }
}

@end
