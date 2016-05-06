//
// Created by Huang ChienShuo on 4/27/13.
// Copyright (c) 2013 ThousandSquare. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton(OSEnlargeArea)

- (void) setEnlargeEdge:(CGFloat) edge;

- (void) setEnlargeEdgeWithTop:(CGFloat) top left:(CGFloat) left bottom:(CGFloat) bottom right:(CGFloat) right;
@end