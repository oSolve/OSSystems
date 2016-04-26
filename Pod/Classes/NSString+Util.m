//
// Created by Huang ChienShuo on 11/17/13.
// Copyright (c) 2013 Liq. All rights reserved.
//


#import "NSString+Util.h"


@implementation NSString(Util)
- (NSString *) stringByTrim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL) isEmpty:(NSString *) string {
    return !string || string.length == 0;
}

@end