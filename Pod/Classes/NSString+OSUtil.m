//
// Created by Huang ChienShuo on 11/17/13.
// Copyright (c) 2013 Liq. All rights reserved.
//


#import "NSString+OSUtil.h"


@implementation NSString(OSUtil)
- (NSString *) stringByTrim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL) isEmpty:(NSString *) string {
    return !string || string.length == 0;
}

@end