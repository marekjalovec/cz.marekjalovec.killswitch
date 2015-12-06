/**
 * Copyright 2015 Marek Jalovec <marek.jalovec@gmail.com>
 *
 * This code is free software. It comes without any warranty,
 * to the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want To
 * Public License, Version 2, as published by Sam Hocevar.
 * See http://www.wtfpl.net/ for more details.
 */

#import <UIKit/UIKit.h>


@protocol KillSwitchViewDelegate <NSObject>

// methods
- (void)killApp;

@end


@interface KillSwitchView : UIView

// properties
@property (nonatomic, weak) id<KillSwitchViewDelegate>delegate;

// methods
- (id)initWithFrame:(CGRect)frame delegate:(id<KillSwitchViewDelegate>)delegate;

@end
