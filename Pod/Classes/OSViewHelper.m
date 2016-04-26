//
// Created by Huang ChienShuo on 9/8/13.
// Copyright (c) 2013 oSolve. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>
#import "OSViewHelper.h"

CGFloat const VIEWS_NAVIGATION_BAR_HEIGHT = 44;
CGFloat const VIEWS_STATUS_BAR_HEIGHT = 20;

@implementation OSViewHelper

+ (BOOL) isRetina {
    return ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [[UIScreen mainScreen] scale] == 2);
}

+ (BOOL) isRetina4 {
    if (![self isRetina]) {
        return NO;
    }
    return [UIScreen mainScreen].bounds.size.height == 568.0f;
}

+ (CGFloat) screenWidth {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return [self widthOfRect:screenRect];
}

+ (CGFloat) screenHeight {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return [self heightOfRect:screenRect];
}

+ (CGFloat) viewHeight {
    return [OSViewHelper screenHeight] - VIEWS_STATUS_BAR_HEIGHT - VIEWS_NAVIGATION_BAR_HEIGHT;
}

+ (void) locate:(UIView *) target x:(CGFloat) x y:(CGFloat) y {
    CGRect rect = target.frame;
    rect.origin.x = x;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView *) target y:(CGFloat) y {
    CGRect rect = target.frame;
    rect.origin.y = y;
    target.frame = rect;
}

+ (void) locate:(UIView *) target x:(CGFloat) x {
    CGRect rect = target.frame;
    rect.origin.x = x;
    target.frame = rect;
}

+ (CGFloat) rightOf:(UIView *) view {
    return [self xOfRect:view.frame] + [self widthOfRect:view.frame];
}

+ (CGFloat) bottomOf:(UIView *) view {
    return [self yOfRect:view.frame] + [self heightOfRect:view.frame];
}

+ (void) alignCenter:(UIView *) target containerWidth:(CGFloat) containerWidth {
    CGRect frame = target.frame;
    frame.origin.x = roundf((containerWidth - [self widthOfRect:frame]) / 2);
    target.frame = frame;
}

+ (void) alignCenterMiddle:(UIView *) target containerFrame:(CGRect) containerFrame {
    CGRect rect = target.frame;
    rect.origin.x = roundf([self xOfRect:containerFrame] + ([self widthOfRect:containerFrame] - [self widthOfRect:rect]) / 2);
    rect.origin.y = roundf([self yOfRect:containerFrame] + ([self heightOfRect:containerFrame] - [self heightOfRect:rect]) / 2);
    target.frame = rect;
}

+ (void) alignMiddle:(UIView *) target containerHeight:(CGFloat) containerHeight {
    CGRect rect = target.frame;
    rect.origin.y = roundf((containerHeight - [self heightOfRect:rect]) / 2);
    target.frame = rect;
}

+ (void) alignBottom:(UIView *) source withTarget:(UIView *) target {
    [self locate:source y:[self bottomOf:target] - [self heightOfRect:source.frame]];
}

+ (void) alignTop:(UIView *) view withTarget:(UIView *) target {
    [self locate:view y:[self yOfRect:target.frame]];
}

+ (void) below:(UIView *) view withTarget:(UIView *) target {
    [self locate:view y:[self yOfRect:target.frame] + [self heightOfRect:target.frame]];
}

+ (void) alignMiddle:(UIView *) source withTarget:(UIView *) target {
    CGPoint newCenter = source.center;
    newCenter.y = target.center.y;
    source.center = newCenter;
}

+ (void) alignCenter:(UIView *) source withTarget:(UIView *) target {
    CGPoint newCenter = source.center;
    newCenter.x = target.center.x;
    source.center = newCenter;
}

+ (void) resize:(UIView *) target containerSize:(CGSize) size {
    CGRect rect = target.frame;
    rect.size = size;
    target.frame = rect;
}

+ (void) resize:(UIView *) target containerWidth:(CGFloat) containerWidth {
    CGRect rect = target.frame;
    rect.size = CGSizeMake(containerWidth, [self heightOfRect:rect]);
    target.frame = rect;
}

+ (void) resize:(UIView *) target containerHeight:(CGFloat) containerHeight {
    CGRect rect = target.frame;
    rect.size = CGSizeMake([self widthOfRect:rect], containerHeight);
    target.frame = rect;
}

+ (void) move:(UIView *) target deltaX:(CGFloat) dx deltaY:(CGFloat) dy {
    CGRect rect = target.frame;
    rect.origin.x += dx;
    rect.origin.y += dy;
    target.frame = rect;
}

+ (CGFloat) yOfView:(UIView *) view {
    return [self yOfRect:view.frame];
}

+ (CGFloat) xOfView:(UIView *) view {
    return [self xOfRect:view.frame];
}

+ (CGFloat) heightOfView:(UIView *) view {
    return [self heightOfRect:view.bounds];
}

+ (CGFloat) widthOfView:(UIView *) view {
    return [self widthOfRect:view.bounds];
}

+ (CGFloat) yOfRect:(CGRect) frame {
    return CGRectGetMinY(frame);
}

+ (CGFloat) xOfRect:(CGRect) frame {
    return CGRectGetMinX(frame);
}

+ (CGFloat) heightOfRect:(CGRect) bounds {
    return CGRectGetHeight(bounds);
}

+ (CGFloat) widthOfRect:(CGRect) bounds {
    return CGRectGetWidth(bounds);
}

+ (CGFloat) statusBarHeight {
    CGRect frame = [[UIApplication sharedApplication] statusBarFrame];
    return [OSViewHelper heightOfRect:frame];
}

+ (void) alignParentBottom:(UIView *) view withParent:(UIView *) parentView {
    CGRect parentFrame = parentView.frame;
    [self locate:view y:[self heightOfRect:parentFrame] - [self heightOfView:view]];
}

@end