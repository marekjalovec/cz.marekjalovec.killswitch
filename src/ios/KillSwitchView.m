/**
 * Copyright 2015 Marek Jalovec <marek.jalovec@gmail.com>
 *
 * This code is free software. It comes without any warranty,
 * to the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want To
 * Public License, Version 2, as published by Sam Hocevar.
 * See http://www.wtfpl.net/ for more details.
 */

#import <QuartzCore/QuartzCore.h>
#import "KillSwitchView.h"


@interface KillSwitchView ()

@property (nonatomic, assign) CGPoint originalPosition;

@end


@implementation KillSwitchView

- (id)initWithFrame:(CGRect)frame delegate:(id<KillSwitchViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.delegate = delegate;

        // kill app on double tap
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self.delegate action:@selector(killApp)];
        tapGesture.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tapGesture];
        
        // allow dragging
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureInProgress:)];
        [self addGestureRecognizer:panGesture];
        
        // set background color
        self.backgroundColor = [UIColor blackColor];
    }
    
    return self;
}

/**
 * Touch began - remenber last position and move to the front
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.superview bringSubviewToFront:self];
    
    self.originalPosition = self.center;
}

/**
 * Pan gesture is in progress
 */
- (void)panGestureInProgress:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.superview];
    
    // calculate X
    CGFloat x = self.originalPosition.x + translation.x;
    x = MAX(x, 0 + self.frame.size.width / 2);
    x = MIN(x, self.superview.frame.size.width - self.frame.size.width / 2);
    
    // calculate Y
    CGFloat y = self.originalPosition.y + translation.y;
    y = MAX(y, 0 + self.frame.size.height / 2);
    y = MIN(y, self.superview.frame.size.height - self.frame.size.height / 2);
    
    // lazy animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.center = CGPointMake(x, y);
    [UIView commitAnimations];
}

/**
 * Draw the "button"
 */
- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor* outline = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* lightFill = [UIColor colorWithRed: 0.97 green: 0.97 blue: 0.97 alpha: 1];
    UIColor* darkFill = [UIColor colorWithRed: 0.907 green: 0.907 blue: 0.907 alpha: 1];
    
    //// http://4vector.com/free-vector/purzen-skull-clip-art-119784
    //// Purzen_Skull_clip_art.svg Group
    {
        //// white Drawing
        UIBezierPath* whitePath = [UIBezierPath bezierPath];
        [whitePath moveToPoint: CGPointMake(15, 36.14)];
        [whitePath addCurveToPoint: CGPointMake(15.37, 37.25) controlPoint1: CGPointMake(14.95, 36.43) controlPoint2: CGPointMake(15.14, 36.9)];
        [whitePath addCurveToPoint: CGPointMake(15.77, 38.13) controlPoint1: CGPointMake(15.54, 37.51) controlPoint2: CGPointMake(15.74, 37.88)];
        [whitePath addCurveToPoint: CGPointMake(16.17, 38.83) controlPoint1: CGPointMake(15.79, 38.37) controlPoint2: CGPointMake(16.04, 38.63)];
        [whitePath addCurveToPoint: CGPointMake(17.21, 39.2) controlPoint1: CGPointMake(16.41, 39.21) controlPoint2: CGPointMake(16.85, 39.12)];
        [whitePath addCurveToPoint: CGPointMake(18.24, 39.36) controlPoint1: CGPointMake(17.57, 39.28) controlPoint2: CGPointMake(17.88, 39.23)];
        [whitePath addCurveToPoint: CGPointMake(19.53, 39.58) controlPoint1: CGPointMake(18.63, 39.51) controlPoint2: CGPointMake(19.12, 39.53)];
        [whitePath addCurveToPoint: CGPointMake(21.27, 39.41) controlPoint1: CGPointMake(20.13, 39.64) controlPoint2: CGPointMake(20.7, 39.51)];
        [whitePath addCurveToPoint: CGPointMake(22.89, 39.32) controlPoint1: CGPointMake(21.8, 39.32) controlPoint2: CGPointMake(22.4, 39.22)];
        [whitePath addCurveToPoint: CGPointMake(24.53, 39.11) controlPoint1: CGPointMake(23.33, 39.42) controlPoint2: CGPointMake(24.04, 39.18)];
        [whitePath addCurveToPoint: CGPointMake(26.18, 38.27) controlPoint1: CGPointMake(25.13, 39.01) controlPoint2: CGPointMake(25.67, 38.58)];
        [whitePath addCurveToPoint: CGPointMake(28.07, 36.73) controlPoint1: CGPointMake(26.82, 37.88) controlPoint2: CGPointMake(27.54, 37.26)];
        [whitePath addCurveToPoint: CGPointMake(28.35, 36.45) controlPoint1: CGPointMake(28.16, 36.63) controlPoint2: CGPointMake(28.25, 36.54)];
        [whitePath addCurveToPoint: CGPointMake(29.13, 35.35) controlPoint1: CGPointMake(28.69, 36.1) controlPoint2: CGPointMake(28.77, 35.72)];
        [whitePath addCurveToPoint: CGPointMake(29.58, 34.35) controlPoint1: CGPointMake(29.34, 35.15) controlPoint2: CGPointMake(29.48, 34.62)];
        [whitePath addCurveToPoint: CGPointMake(30.47, 32.69) controlPoint1: CGPointMake(29.78, 33.86) controlPoint2: CGPointMake(30.18, 33.15)];
        [whitePath addCurveToPoint: CGPointMake(31.03, 31.96) controlPoint1: CGPointMake(30.66, 32.38) controlPoint2: CGPointMake(30.7, 32.27)];
        [whitePath addCurveToPoint: CGPointMake(32.51, 30.95) controlPoint1: CGPointMake(31.46, 31.57) controlPoint2: CGPointMake(31.99, 31.26)];
        [whitePath addCurveToPoint: CGPointMake(33.57, 29.91) controlPoint1: CGPointMake(33.01, 30.64) controlPoint2: CGPointMake(33.31, 30.33)];
        [whitePath addCurveToPoint: CGPointMake(35.42, 28.5) controlPoint1: CGPointMake(33.85, 29.46) controlPoint2: CGPointMake(34.96, 28.79)];
        [whitePath addCurveToPoint: CGPointMake(35.67, 28.35) controlPoint1: CGPointMake(35.5, 28.45) controlPoint2: CGPointMake(35.59, 28.4)];
        [whitePath addCurveToPoint: CGPointMake(36.22, 27.51) controlPoint1: CGPointMake(35.95, 28.18) controlPoint2: CGPointMake(36.11, 27.8)];
        [whitePath addCurveToPoint: CGPointMake(36.68, 26) controlPoint1: CGPointMake(36.42, 27.02) controlPoint2: CGPointMake(36.51, 26.48)];
        [whitePath addCurveToPoint: CGPointMake(37.22, 24.33) controlPoint1: CGPointMake(36.9, 25.4) controlPoint2: CGPointMake(37.08, 24.93)];
        [whitePath addCurveToPoint: CGPointMake(37.53, 21.8) controlPoint1: CGPointMake(37.41, 23.51) controlPoint2: CGPointMake(37.55, 22.61)];
        [whitePath addCurveToPoint: CGPointMake(37.96, 19.97) controlPoint1: CGPointMake(37.52, 21.22) controlPoint2: CGPointMake(37.98, 20.6)];
        [whitePath addCurveToPoint: CGPointMake(38.04, 18.13) controlPoint1: CGPointMake(37.95, 19.37) controlPoint2: CGPointMake(38.1, 18.76)];
        [whitePath addCurveToPoint: CGPointMake(37.45, 16.87) controlPoint1: CGPointMake(38, 17.75) controlPoint2: CGPointMake(37.6, 17.22)];
        [whitePath addCurveToPoint: CGPointMake(36.81, 15.7) controlPoint1: CGPointMake(37.28, 16.46) controlPoint2: CGPointMake(37.05, 16.07)];
        [whitePath addCurveToPoint: CGPointMake(36.15, 14.86) controlPoint1: CGPointMake(36.6, 15.37) controlPoint2: CGPointMake(36.41, 15.12)];
        [whitePath addCurveToPoint: CGPointMake(36.01, 14.73) controlPoint1: CGPointMake(36.11, 14.82) controlPoint2: CGPointMake(36.06, 14.77)];
        [whitePath addCurveToPoint: CGPointMake(35.11, 13.88) controlPoint1: CGPointMake(35.7, 14.45) controlPoint2: CGPointMake(35.42, 14.16)];
        [whitePath addCurveToPoint: CGPointMake(33.84, 12.98) controlPoint1: CGPointMake(34.72, 13.52) controlPoint2: CGPointMake(34.21, 13.36)];
        [whitePath addCurveToPoint: CGPointMake(32.51, 12.44) controlPoint1: CGPointMake(33.52, 12.66) controlPoint2: CGPointMake(32.96, 12.54)];
        [whitePath addCurveToPoint: CGPointMake(30.15, 11.92) controlPoint1: CGPointMake(31.7, 12.27) controlPoint2: CGPointMake(30.84, 12.33)];
        [whitePath addCurveToPoint: CGPointMake(28.86, 11.54) controlPoint1: CGPointMake(29.79, 11.71) controlPoint2: CGPointMake(29.26, 11.62)];
        [whitePath addCurveToPoint: CGPointMake(27.13, 11.08) controlPoint1: CGPointMake(28.28, 11.41) controlPoint2: CGPointMake(27.7, 11.21)];
        [whitePath addCurveToPoint: CGPointMake(26.9, 11) controlPoint1: CGPointMake(27.05, 11.07) controlPoint2: CGPointMake(26.98, 11.03)];
        [whitePath addCurveToPoint: CGPointMake(25.78, 10.96) controlPoint1: CGPointMake(26.61, 10.89) controlPoint2: CGPointMake(26.05, 10.93)];
        [whitePath addCurveToPoint: CGPointMake(23.76, 10.78) controlPoint1: CGPointMake(25.09, 11.02) controlPoint2: CGPointMake(24.44, 10.84)];
        [whitePath addCurveToPoint: CGPointMake(23.52, 10.77) controlPoint1: CGPointMake(23.68, 10.78) controlPoint2: CGPointMake(23.6, 10.77)];
        [whitePath addCurveToPoint: CGPointMake(22.2, 10.78) controlPoint1: CGPointMake(23.05, 10.73) controlPoint2: CGPointMake(22.66, 10.83)];
        [whitePath addCurveToPoint: CGPointMake(20.45, 11.18) controlPoint1: CGPointMake(21.67, 10.72) controlPoint2: CGPointMake(20.94, 11.03)];
        [whitePath addCurveToPoint: CGPointMake(18.58, 12.04) controlPoint1: CGPointMake(19.82, 11.38) controlPoint2: CGPointMake(19.2, 11.81)];
        [whitePath addCurveToPoint: CGPointMake(17.72, 12.68) controlPoint1: CGPointMake(18.2, 12.18) controlPoint2: CGPointMake(17.96, 12.36)];
        [whitePath addCurveToPoint: CGPointMake(16.56, 13.55) controlPoint1: CGPointMake(17.48, 13) controlPoint2: CGPointMake(16.9, 13.34)];
        [whitePath addCurveToPoint: CGPointMake(15.77, 14.48) controlPoint1: CGPointMake(16.18, 13.78) controlPoint2: CGPointMake(16, 14.05)];
        [whitePath addCurveToPoint: CGPointMake(15.22, 15.76) controlPoint1: CGPointMake(15.54, 14.93) controlPoint2: CGPointMake(15.47, 15.37)];
        [whitePath addCurveToPoint: CGPointMake(14.84, 16.95) controlPoint1: CGPointMake(15.02, 16.09) controlPoint2: CGPointMake(14.92, 16.59)];
        [whitePath addCurveToPoint: CGPointMake(14.48, 18.17) controlPoint1: CGPointMake(14.73, 17.41) controlPoint2: CGPointMake(14.59, 17.71)];
        [whitePath addCurveToPoint: CGPointMake(14.25, 19.15) controlPoint1: CGPointMake(14.39, 18.56) controlPoint2: CGPointMake(14.32, 18.87)];
        [whitePath addCurveToPoint: CGPointMake(13.92, 20.42) controlPoint1: CGPointMake(14.16, 19.55) controlPoint2: CGPointMake(14.01, 20.03)];
        [whitePath addCurveToPoint: CGPointMake(13.27, 21.2) controlPoint1: CGPointMake(13.86, 20.66) controlPoint2: CGPointMake(13.43, 20.94)];
        [whitePath addCurveToPoint: CGPointMake(12.71, 22.38) controlPoint1: CGPointMake(12.99, 21.65) controlPoint2: CGPointMake(12.81, 21.97)];
        [whitePath addCurveToPoint: CGPointMake(12.46, 23.42) controlPoint1: CGPointMake(12.62, 22.75) controlPoint2: CGPointMake(12.49, 23.13)];
        [whitePath addCurveToPoint: CGPointMake(12.32, 24.35) controlPoint1: CGPointMake(12.44, 23.76) controlPoint2: CGPointMake(12.34, 24.08)];
        [whitePath addCurveToPoint: CGPointMake(12.37, 25.5) controlPoint1: CGPointMake(12.28, 24.73) controlPoint2: CGPointMake(12.31, 25.18)];
        [whitePath addCurveToPoint: CGPointMake(12.62, 26.51) controlPoint1: CGPointMake(12.44, 25.88) controlPoint2: CGPointMake(12.47, 26.13)];
        [whitePath addCurveToPoint: CGPointMake(12.84, 27.56) controlPoint1: CGPointMake(12.76, 26.86) controlPoint2: CGPointMake(12.71, 27.19)];
        [whitePath addCurveToPoint: CGPointMake(12.95, 28.72) controlPoint1: CGPointMake(12.96, 27.94) controlPoint2: CGPointMake(12.91, 28.33)];
        [whitePath addCurveToPoint: CGPointMake(12.98, 29.65) controlPoint1: CGPointMake(12.99, 29.05) controlPoint2: CGPointMake(12.84, 29.32)];
        [whitePath addCurveToPoint: CGPointMake(13.78, 30.34) controlPoint1: CGPointMake(13.14, 30.01) controlPoint2: CGPointMake(13.44, 30.31)];
        [whitePath addCurveToPoint: CGPointMake(14.67, 30.74) controlPoint1: CGPointMake(14.04, 30.36) controlPoint2: CGPointMake(14.43, 30.6)];
        [whitePath addCurveToPoint: CGPointMake(15, 31.61) controlPoint1: CGPointMake(14.99, 30.93) controlPoint2: CGPointMake(14.87, 31.23)];
        [whitePath addCurveToPoint: CGPointMake(15.15, 32.64) controlPoint1: CGPointMake(15.15, 32.06) controlPoint2: CGPointMake(15.18, 32.25)];
        [whitePath addCurveToPoint: CGPointMake(15.24, 33.75) controlPoint1: CGPointMake(15.12, 33) controlPoint2: CGPointMake(15.12, 33.39)];
        [whitePath addCurveToPoint: CGPointMake(15.48, 34.67) controlPoint1: CGPointMake(15.34, 34.07) controlPoint2: CGPointMake(15.45, 34.34)];
        [whitePath addCurveToPoint: CGPointMake(15.27, 35.58) controlPoint1: CGPointMake(15.51, 34.91) controlPoint2: CGPointMake(15.41, 35.35)];
        [whitePath addCurveToPoint: CGPointMake(15, 36.14) controlPoint1: CGPointMake(15.18, 35.71) controlPoint2: CGPointMake(15.08, 35.95)];
        [whitePath closePath];
        whitePath.miterLimit = 4;
        
        whitePath.usesEvenOddFillRule = YES;
        
        [lightFill setFill];
        [whitePath fill];
        
        
        //// gray Drawing
        UIBezierPath* grayPath = [UIBezierPath bezierPath];
        [grayPath moveToPoint: CGPointMake(29.9, 11.48)];
        [grayPath addLineToPoint: CGPointMake(29.67, 11.7)];
        [grayPath addCurveToPoint: CGPointMake(30.66, 12.28) controlPoint1: CGPointMake(29.97, 12) controlPoint2: CGPointMake(30.34, 12.14)];
        [grayPath addCurveToPoint: CGPointMake(31.39, 12.84) controlPoint1: CGPointMake(30.97, 12.43) controlPoint2: CGPointMake(31.24, 12.57)];
        [grayPath addCurveToPoint: CGPointMake(31.73, 14.43) controlPoint1: CGPointMake(31.75, 13.47) controlPoint2: CGPointMake(31.89, 13.72)];
        [grayPath addCurveToPoint: CGPointMake(30.61, 16.66) controlPoint1: CGPointMake(31.58, 15.14) controlPoint2: CGPointMake(31.11, 16.12)];
        [grayPath addCurveToPoint: CGPointMake(29.35, 18.25) controlPoint1: CGPointMake(30.07, 17.24) controlPoint2: CGPointMake(29.77, 17.75)];
        [grayPath addCurveToPoint: CGPointMake(28.23, 20.06) controlPoint1: CGPointMake(28.91, 18.75) controlPoint2: CGPointMake(28.35, 19.34)];
        [grayPath addCurveToPoint: CGPointMake(28.18, 22.05) controlPoint1: CGPointMake(28.11, 20.77) controlPoint2: CGPointMake(28.28, 21.46)];
        [grayPath addCurveToPoint: CGPointMake(28.65, 23.94) controlPoint1: CGPointMake(28.06, 22.72) controlPoint2: CGPointMake(28.2, 23.43)];
        [grayPath addCurveToPoint: CGPointMake(29.52, 24.53) controlPoint1: CGPointMake(28.9, 24.21) controlPoint2: CGPointMake(29.25, 24.35)];
        [grayPath addCurveToPoint: CGPointMake(29.85, 24.82) controlPoint1: CGPointMake(29.66, 24.62) controlPoint2: CGPointMake(29.77, 24.72)];
        [grayPath addCurveToPoint: CGPointMake(29.96, 25.22) controlPoint1: CGPointMake(29.92, 24.93) controlPoint2: CGPointMake(29.96, 25.05)];
        [grayPath addCurveToPoint: CGPointMake(29.94, 26.49) controlPoint1: CGPointMake(29.93, 25.63) controlPoint2: CGPointMake(29.94, 26.09)];
        [grayPath addCurveToPoint: CGPointMake(29.88, 27.35) controlPoint1: CGPointMake(29.93, 26.86) controlPoint2: CGPointMake(29.92, 27.18)];
        [grayPath addCurveToPoint: CGPointMake(29.87, 27.37) controlPoint1: CGPointMake(29.88, 27.35) controlPoint2: CGPointMake(29.87, 27.36)];
        [grayPath addCurveToPoint: CGPointMake(29.04, 28) controlPoint1: CGPointMake(29.69, 27.65) controlPoint2: CGPointMake(29.48, 27.74)];
        [grayPath addCurveToPoint: CGPointMake(28.23, 28.56) controlPoint1: CGPointMake(28.79, 28.14) controlPoint2: CGPointMake(28.52, 28.36)];
        [grayPath addCurveToPoint: CGPointMake(27.35, 28.99) controlPoint1: CGPointMake(27.93, 28.76) controlPoint2: CGPointMake(27.62, 28.93)];
        [grayPath addCurveToPoint: CGPointMake(25.57, 29.5) controlPoint1: CGPointMake(26.7, 29.13) controlPoint2: CGPointMake(26.13, 29.37)];
        [grayPath addCurveToPoint: CGPointMake(24.66, 29.72) controlPoint1: CGPointMake(25.28, 29.56) controlPoint2: CGPointMake(24.96, 29.61)];
        [grayPath addCurveToPoint: CGPointMake(24.24, 29.94) controlPoint1: CGPointMake(24.51, 29.77) controlPoint2: CGPointMake(24.37, 29.85)];
        [grayPath addCurveToPoint: CGPointMake(23.92, 30.31) controlPoint1: CGPointMake(24.11, 30.04) controlPoint2: CGPointMake(24, 30.16)];
        [grayPath addCurveToPoint: CGPointMake(24, 31.16) controlPoint1: CGPointMake(23.75, 30.62) controlPoint2: CGPointMake(23.84, 30.93)];
        [grayPath addCurveToPoint: CGPointMake(24.5, 31.76) controlPoint1: CGPointMake(24.16, 31.38) controlPoint2: CGPointMake(24.37, 31.57)];
        [grayPath addCurveToPoint: CGPointMake(24.89, 32.48) controlPoint1: CGPointMake(24.64, 31.96) controlPoint2: CGPointMake(24.81, 32.22)];
        [grayPath addCurveToPoint: CGPointMake(24.89, 33.25) controlPoint1: CGPointMake(24.98, 32.75) controlPoint2: CGPointMake(24.99, 33.02)];
        [grayPath addCurveToPoint: CGPointMake(24.35, 33.86) controlPoint1: CGPointMake(24.79, 33.47) controlPoint2: CGPointMake(24.58, 33.64)];
        [grayPath addCurveToPoint: CGPointMake(23.79, 34.74) controlPoint1: CGPointMake(24.13, 34.07) controlPoint2: CGPointMake(23.89, 34.33)];
        [grayPath addCurveToPoint: CGPointMake(22.91, 37.16) controlPoint1: CGPointMake(23.61, 35.44) controlPoint2: CGPointMake(23.16, 36.47)];
        [grayPath addCurveToPoint: CGPointMake(22.66, 38.1) controlPoint1: CGPointMake(22.78, 37.52) controlPoint2: CGPointMake(22.73, 37.84)];
        [grayPath addCurveToPoint: CGPointMake(22.29, 38.71) controlPoint1: CGPointMake(22.59, 38.36) controlPoint2: CGPointMake(22.51, 38.55)];
        [grayPath addCurveToPoint: CGPointMake(20.81, 39.73) controlPoint1: CGPointMake(21.78, 39.09) controlPoint2: CGPointMake(21.33, 39.46)];
        [grayPath addLineToPoint: CGPointMake(20.96, 40)];
        [grayPath addCurveToPoint: CGPointMake(23.64, 39.37) controlPoint1: CGPointMake(21.52, 39.71) controlPoint2: CGPointMake(23.14, 39.74)];
        [grayPath addCurveToPoint: CGPointMake(26.84, 37.66) controlPoint1: CGPointMake(23.93, 39.16) controlPoint2: CGPointMake(26.56, 37.78)];
        [grayPath addCurveToPoint: CGPointMake(29.55, 34.62) controlPoint1: CGPointMake(28, 37.13) controlPoint2: CGPointMake(29.48, 35.56)];
        [grayPath addCurveToPoint: CGPointMake(31.54, 31.08) controlPoint1: CGPointMake(29.6, 33.91) controlPoint2: CGPointMake(31.35, 31.83)];
        [grayPath addCurveToPoint: CGPointMake(35.09, 29.02) controlPoint1: CGPointMake(31.62, 30.76) controlPoint2: CGPointMake(34.87, 29.23)];
        [grayPath addCurveToPoint: CGPointMake(36.9, 25.78) controlPoint1: CGPointMake(35.3, 28.82) controlPoint2: CGPointMake(36.76, 26.09)];
        [grayPath addCurveToPoint: CGPointMake(37.72, 21.84) controlPoint1: CGPointMake(37.04, 25.47) controlPoint2: CGPointMake(37.82, 22.15)];
        [grayPath addCurveToPoint: CGPointMake(38.17, 18.91) controlPoint1: CGPointMake(37.61, 21.52) controlPoint2: CGPointMake(38.33, 19.13)];
        [grayPath addCurveToPoint: CGPointMake(37.69, 16.8) controlPoint1: CGPointMake(38.01, 18.68) controlPoint2: CGPointMake(37.82, 16.98)];
        [grayPath addCurveToPoint: CGPointMake(36.86, 15.42) controlPoint1: CGPointMake(37.57, 16.62) controlPoint2: CGPointMake(36.74, 15.64)];
        [grayPath addCurveToPoint: CGPointMake(35.1, 13.68) controlPoint1: CGPointMake(36.98, 15.19) controlPoint2: CGPointMake(34.85, 13.78)];
        [grayPath addCurveToPoint: CGPointMake(32.12, 11.86) controlPoint1: CGPointMake(35.35, 13.59) controlPoint2: CGPointMake(32.05, 12.02)];
        [grayPath addCurveToPoint: CGPointMake(32.03, 12.12) controlPoint1: CGPointMake(32.07, 11.87) controlPoint2: CGPointMake(32.04, 11.96)];
        [grayPath addCurveToPoint: CGPointMake(30.79, 12.01) controlPoint1: CGPointMake(31.68, 11.99) controlPoint2: CGPointMake(31.06, 12.13)];
        [grayPath addCurveToPoint: CGPointMake(29.9, 11.48) controlPoint1: CGPointMake(30.47, 11.86) controlPoint2: CGPointMake(30.15, 11.72)];
        [grayPath closePath];
        grayPath.miterLimit = 4;
        
        grayPath.usesEvenOddFillRule = YES;
        
        [darkFill setFill];
        [grayPath fill];
        
        
        //// black Drawing
        UIBezierPath* blackPath = [UIBezierPath bezierPath];
        [blackPath moveToPoint: CGPointMake(26.31, 38.52)];
        [blackPath addCurveToPoint: CGPointMake(19.49, 40.17) controlPoint1: CGPointMake(24.04, 39.91) controlPoint2: CGPointMake(22.11, 40.37)];
        [blackPath addCurveToPoint: CGPointMake(16.52, 39.34) controlPoint1: CGPointMake(18.13, 40.07) controlPoint2: CGPointMake(16.74, 39.68)];
        [blackPath addCurveToPoint: CGPointMake(16.07, 39.1) controlPoint1: CGPointMake(16.45, 39.25) controlPoint2: CGPointMake(16.25, 39.14)];
        [blackPath addCurveToPoint: CGPointMake(14.85, 34.81) controlPoint1: CGPointMake(15.17, 38.9) controlPoint2: CGPointMake(14.43, 36.28)];
        [blackPath addCurveToPoint: CGPointMake(14.88, 33.64) controlPoint1: CGPointMake(14.99, 34.35) controlPoint2: CGPointMake(15, 33.83)];
        [blackPath addCurveToPoint: CGPointMake(14.63, 32.09) controlPoint1: CGPointMake(14.76, 33.46) controlPoint2: CGPointMake(14.65, 32.76)];
        [blackPath addCurveToPoint: CGPointMake(13.92, 30.78) controlPoint1: CGPointMake(14.59, 30.96) controlPoint2: CGPointMake(14.54, 30.86)];
        [blackPath addCurveToPoint: CGPointMake(12.75, 28.75) controlPoint1: CGPointMake(12.8, 30.64) controlPoint2: CGPointMake(12.84, 29.88)];
        [blackPath addCurveToPoint: CGPointMake(12.1, 25.16) controlPoint1: CGPointMake(13.02, 27.39) controlPoint2: CGPointMake(12.27, 26.54)];
        [blackPath addCurveToPoint: CGPointMake(13.35, 20.6) controlPoint1: CGPointMake(11.69, 23.54) controlPoint2: CGPointMake(12.61, 20.7)];
        [blackPath addCurveToPoint: CGPointMake(14.12, 17.95) controlPoint1: CGPointMake(13.87, 19.73) controlPoint2: CGPointMake(13.84, 19.08)];
        [blackPath addCurveToPoint: CGPointMake(23.84, 10.01) controlPoint1: CGPointMake(15.15, 13.1) controlPoint2: CGPointMake(19.01, 10.4)];
        [blackPath addCurveToPoint: CGPointMake(32.59, 11.71) controlPoint1: CGPointMake(25.38, 9.88) controlPoint2: CGPointMake(30.68, 10.92)];
        [blackPath addCurveToPoint: CGPointMake(37.14, 15.28) controlPoint1: CGPointMake(34.38, 12.46) controlPoint2: CGPointMake(36.33, 14.14)];
        [blackPath addCurveToPoint: CGPointMake(37.85, 23.8) controlPoint1: CGPointMake(39, 17.9) controlPoint2: CGPointMake(38.67, 20.43)];
        [blackPath addCurveToPoint: CGPointMake(33.98, 30.22) controlPoint1: CGPointMake(36.78, 28.18) controlPoint2: CGPointMake(36.45, 28.71)];
        [blackPath addCurveToPoint: CGPointMake(29.98, 35.05) controlPoint1: CGPointMake(30.93, 32.08) controlPoint2: CGPointMake(30.57, 32.52)];
        [blackPath addCurveToPoint: CGPointMake(26.31, 38.52) controlPoint1: CGPointMake(29.27, 36.8) controlPoint2: CGPointMake(28.42, 37.3)];
        [blackPath closePath];
        [blackPath moveToPoint: CGPointMake(29.38, 33.4)];
        [blackPath addCurveToPoint: CGPointMake(32.2, 28.54) controlPoint1: CGPointMake(29.91, 31.2) controlPoint2: CGPointMake(30.81, 29.66)];
        [blackPath addCurveToPoint: CGPointMake(33.68, 27.95) controlPoint1: CGPointMake(33.2, 27.74) controlPoint2: CGPointMake(33.47, 27.63)];
        [blackPath addCurveToPoint: CGPointMake(32.93, 29.25) controlPoint1: CGPointMake(33.84, 28.2) controlPoint2: CGPointMake(33.58, 28.66)];
        [blackPath addLineToPoint: CGPointMake(31.93, 30.17)];
        [blackPath addLineToPoint: CGPointMake(33.32, 29.45)];
        [blackPath addCurveToPoint: CGPointMake(35.2, 28.23) controlPoint1: CGPointMake(34.08, 29.06) controlPoint2: CGPointMake(34.93, 28.51)];
        [blackPath addCurveToPoint: CGPointMake(37.58, 19.54) controlPoint1: CGPointMake(35.93, 27.49) controlPoint2: CGPointMake(37.49, 21.77)];
        [blackPath addCurveToPoint: CGPointMake(36.43, 15.76) controlPoint1: CGPointMake(37.64, 17.8) controlPoint2: CGPointMake(37.54, 17.47)];
        [blackPath addCurveToPoint: CGPointMake(34.48, 13.68) controlPoint1: CGPointMake(35.56, 14.42) controlPoint2: CGPointMake(35.67, 14.57)];
        [blackPath addCurveToPoint: CGPointMake(25.77, 11.2) controlPoint1: CGPointMake(33.28, 12.77) controlPoint2: CGPointMake(28.87, 11.54)];
        [blackPath addCurveToPoint: CGPointMake(15.27, 16.9) controlPoint1: CGPointMake(20.58, 10.81) controlPoint2: CGPointMake(17.32, 12.58)];
        [blackPath addCurveToPoint: CGPointMake(14.14, 20.77) controlPoint1: CGPointMake(14.79, 17.9) controlPoint2: CGPointMake(14.53, 20.18)];
        [blackPath addCurveToPoint: CGPointMake(12.94, 23.75) controlPoint1: CGPointMake(13.32, 22.03) controlPoint2: CGPointMake(13.14, 22.42)];
        [blackPath addCurveToPoint: CGPointMake(12.8, 25.19) controlPoint1: CGPointMake(12.82, 24.21) controlPoint2: CGPointMake(12.79, 25)];
        [blackPath addCurveToPoint: CGPointMake(13.55, 28.91) controlPoint1: CGPointMake(12.83, 26.47) controlPoint2: CGPointMake(13.81, 27.65)];
        [blackPath addCurveToPoint: CGPointMake(14.45, 30.01) controlPoint1: CGPointMake(13.6, 29.67) controlPoint2: CGPointMake(13.1, 29.68)];
        [blackPath addLineToPoint: CGPointMake(15.94, 30.36)];
        [blackPath addLineToPoint: CGPointMake(15.64, 31.21)];
        [blackPath addCurveToPoint: CGPointMake(15.73, 33.04) controlPoint1: CGPointMake(15.48, 31.68) controlPoint2: CGPointMake(15.52, 32.5)];
        [blackPath addCurveToPoint: CGPointMake(16.33, 33.4) controlPoint1: CGPointMake(16.08, 33.92) controlPoint2: CGPointMake(16.2, 33.97)];
        [blackPath addCurveToPoint: CGPointMake(17.16, 33.47) controlPoint1: CGPointMake(16.53, 32.53) controlPoint2: CGPointMake(17.27, 32.68)];
        [blackPath addCurveToPoint: CGPointMake(17.73, 33.31) controlPoint1: CGPointMake(17.07, 34.13) controlPoint2: CGPointMake(17.57, 34)];
        [blackPath addCurveToPoint: CGPointMake(18.62, 33.57) controlPoint1: CGPointMake(17.93, 32.46) controlPoint2: CGPointMake(18.78, 32.71)];
        [blackPath addCurveToPoint: CGPointMake(19.16, 33.53) controlPoint1: CGPointMake(18.32, 34.47) controlPoint2: CGPointMake(19.14, 34.14)];
        [blackPath addCurveToPoint: CGPointMake(20.18, 33.74) controlPoint1: CGPointMake(19.3, 32.74) controlPoint2: CGPointMake(20.2, 32.92)];
        [blackPath addCurveToPoint: CGPointMake(20.82, 33.59) controlPoint1: CGPointMake(20.46, 34.55) controlPoint2: CGPointMake(20.93, 34.08)];
        [blackPath addCurveToPoint: CGPointMake(21.75, 33.67) controlPoint1: CGPointMake(20.7, 33.08) controlPoint2: CGPointMake(21.66, 32.67)];
        [blackPath addCurveToPoint: CGPointMake(22.37, 33.63) controlPoint1: CGPointMake(21.88, 34.39) controlPoint2: CGPointMake(22.32, 34.17)];
        [blackPath addCurveToPoint: CGPointMake(23.23, 33.44) controlPoint1: CGPointMake(22.32, 33.02) controlPoint2: CGPointMake(23.14, 32.95)];
        [blackPath addCurveToPoint: CGPointMake(23.86, 33.35) controlPoint1: CGPointMake(23.37, 34.2) controlPoint2: CGPointMake(23.92, 34.04)];
        [blackPath addCurveToPoint: CGPointMake(24.77, 33.12) controlPoint1: CGPointMake(23.81, 32.7) controlPoint2: CGPointMake(24.73, 32.44)];
        [blackPath addCurveToPoint: CGPointMake(27.27, 30.96) controlPoint1: CGPointMake(24.8, 33.7) controlPoint2: CGPointMake(25.93, 32.61)];
        [blackPath addCurveToPoint: CGPointMake(29.43, 29.52) controlPoint1: CGPointMake(28.53, 29.4) controlPoint2: CGPointMake(28.57, 29.37)];
        [blackPath addCurveToPoint: CGPointMake(29.51, 30.49) controlPoint1: CGPointMake(30.45, 29.7) controlPoint2: CGPointMake(30.51, 30.44)];
        [blackPath addCurveToPoint: CGPointMake(27.88, 31.81) controlPoint1: CGPointMake(29.07, 30.51) controlPoint2: CGPointMake(28.58, 30.91)];
        [blackPath addCurveToPoint: CGPointMake(25.94, 33.66) controlPoint1: CGPointMake(27.33, 32.51) controlPoint2: CGPointMake(26.46, 33.35)];
        [blackPath addCurveToPoint: CGPointMake(24.83, 34.89) controlPoint1: CGPointMake(25.29, 34.06) controlPoint2: CGPointMake(24.65, 34.61)];
        [blackPath addCurveToPoint: CGPointMake(24.02, 35.34) controlPoint1: CGPointMake(25, 35.62) controlPoint2: CGPointMake(24.21, 36.06)];
        [blackPath addCurveToPoint: CGPointMake(23.43, 35.46) controlPoint1: CGPointMake(23.69, 34.69) controlPoint2: CGPointMake(23.37, 34.81)];
        [blackPath addCurveToPoint: CGPointMake(22.45, 35.52) controlPoint1: CGPointMake(23.59, 36.37) controlPoint2: CGPointMake(22.5, 36.42)];
        [blackPath addCurveToPoint: CGPointMake(21.86, 35.57) controlPoint1: CGPointMake(22.27, 34.89) controlPoint2: CGPointMake(21.84, 35.03)];
        [blackPath addCurveToPoint: CGPointMake(20.83, 35.75) controlPoint1: CGPointMake(21.9, 36.6) controlPoint2: CGPointMake(20.95, 36.75)];
        [blackPath addCurveToPoint: CGPointMake(20.12, 35.75) controlPoint1: CGPointMake(20.72, 34.86) controlPoint2: CGPointMake(20.21, 35.02)];
        [blackPath addCurveToPoint: CGPointMake(19.13, 35.64) controlPoint1: CGPointMake(20.07, 36.69) controlPoint2: CGPointMake(19.16, 36.46)];
        [blackPath addCurveToPoint: CGPointMake(18.44, 35.65) controlPoint1: CGPointMake(19.16, 34.73) controlPoint2: CGPointMake(18.52, 34.86)];
        [blackPath addCurveToPoint: CGPointMake(17.48, 35.76) controlPoint1: CGPointMake(18.24, 36.39) controlPoint2: CGPointMake(17.66, 36.47)];
        [blackPath addCurveToPoint: CGPointMake(16.89, 35.31) controlPoint1: CGPointMake(17.79, 35.14) controlPoint2: CGPointMake(17, 34.21)];
        [blackPath addCurveToPoint: CGPointMake(16.42, 36.01) controlPoint1: CGPointMake(16.86, 35.69) controlPoint2: CGPointMake(16.65, 36.01)];
        [blackPath addCurveToPoint: CGPointMake(16.13, 35.24) controlPoint1: CGPointMake(16.12, 36.02) controlPoint2: CGPointMake(16.04, 35.78)];
        [blackPath addCurveToPoint: CGPointMake(15.96, 34.65) controlPoint1: CGPointMake(16.22, 34.78) controlPoint2: CGPointMake(16.15, 34.54)];
        [blackPath addCurveToPoint: CGPointMake(16.21, 38.02) controlPoint1: CGPointMake(15.46, 34.96) controlPoint2: CGPointMake(15.63, 37.11)];
        [blackPath addCurveToPoint: CGPointMake(18.98, 39.16) controlPoint1: CGPointMake(16.65, 38.69) controlPoint2: CGPointMake(17.15, 38.9)];
        [blackPath addCurveToPoint: CGPointMake(25.91, 37.65) controlPoint1: CGPointMake(21.72, 39.55) controlPoint2: CGPointMake(22.69, 39.34)];
        [blackPath addCurveToPoint: CGPointMake(29.38, 33.4) controlPoint1: CGPointMake(28.67, 36.2) controlPoint2: CGPointMake(28.7, 36.16)];
        [blackPath closePath];
        [blackPath moveToPoint: CGPointMake(25.75, 28.46)];
        [blackPath addCurveToPoint: CGPointMake(23.5, 28.19) controlPoint1: CGPointMake(25.23, 28.44) controlPoint2: CGPointMake(24.22, 28.32)];
        [blackPath addCurveToPoint: CGPointMake(20.3, 24.2) controlPoint1: CGPointMake(22.1, 27.92) controlPoint2: CGPointMake(21.86, 27.63)];
        [blackPath addCurveToPoint: CGPointMake(20.45, 22.18) controlPoint1: CGPointMake(19.69, 22.86) controlPoint2: CGPointMake(19.7, 22.74)];
        [blackPath addCurveToPoint: CGPointMake(25.93, 22.68) controlPoint1: CGPointMake(21.81, 21.16) controlPoint2: CGPointMake(23.2, 21.29)];
        [blackPath addCurveToPoint: CGPointMake(28.14, 24.35) controlPoint1: CGPointMake(27.32, 23.38) controlPoint2: CGPointMake(27.76, 23.84)];
        [blackPath addCurveToPoint: CGPointMake(28.52, 26.08) controlPoint1: CGPointMake(28.53, 24.86) controlPoint2: CGPointMake(28.72, 25.26)];
        [blackPath addCurveToPoint: CGPointMake(25.75, 28.46) controlPoint1: CGPointMake(28.13, 27.76) controlPoint2: CGPointMake(27.27, 28.5)];
        [blackPath closePath];
        [blackPath moveToPoint: CGPointMake(19.3, 30.26)];
        [blackPath addCurveToPoint: CGPointMake(18.24, 30.36) controlPoint1: CGPointMake(18.94, 30.18) controlPoint2: CGPointMake(18.46, 30.23)];
        [blackPath addCurveToPoint: CGPointMake(17.14, 27.52) controlPoint1: CGPointMake(17.21, 30.99) controlPoint2: CGPointMake(16.5, 29.17)];
        [blackPath addCurveToPoint: CGPointMake(19.65, 27.7) controlPoint1: CGPointMake(17.77, 25.9) controlPoint2: CGPointMake(18.51, 25.95)];
        [blackPath addCurveToPoint: CGPointMake(19.3, 30.26) controlPoint1: CGPointMake(20.95, 29.71) controlPoint2: CGPointMake(20.83, 30.6)];
        [blackPath closePath];
        [blackPath moveToPoint: CGPointMake(14.47, 26.75)];
        [blackPath addCurveToPoint: CGPointMake(13.17, 24.46) controlPoint1: CGPointMake(13.5, 26.23) controlPoint2: CGPointMake(13.13, 26.09)];
        [blackPath addCurveToPoint: CGPointMake(17.7, 22.75) controlPoint1: CGPointMake(13.23, 21.18) controlPoint2: CGPointMake(16.09, 21.22)];
        [blackPath addCurveToPoint: CGPointMake(17.93, 24.52) controlPoint1: CGPointMake(18.2, 23.23) controlPoint2: CGPointMake(18.25, 23.57)];
        [blackPath addCurveToPoint: CGPointMake(14.47, 26.75) controlPoint1: CGPointMake(17.4, 26.11) controlPoint2: CGPointMake(15.53, 27.32)];
        [blackPath closePath];
        blackPath.miterLimit = 4;
        
        [outline setFill];
        [blackPath fill];
    }

    // crop layer
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = [UIBezierPath bezierPathWithOvalInRect:rect].CGPath;
    layer.frame = self.bounds;
    layer.opacity = .4f;
    self.layer.mask = layer;
}

@end
