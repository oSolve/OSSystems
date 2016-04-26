//
// Created by liq on 5/12/14.
// Copyright (c) 2014 liq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOOLPref : NSObject

+ (instancetype) prefWithKey:(NSString *) key;

+ (instancetype) prefWithKey:(NSString *) key defaultValue:(BOOL) defaultValue;

- (void) setBool:(BOOL) boolValue;

- (BOOL) boolValue;
@end

@interface NSStringPref : NSObject

+ (instancetype) prefWithKey:(NSString *) key;

+ (instancetype) prefWithKey:(NSString *) key defaultString:(NSString *) defaultString;

- (void) setString:(NSString *) string;

- (NSString *) stringValue;

- (void) removeString;

@end

@interface NSNumberPref : NSObject

+ (instancetype) prefWithKey:(NSString *) key;

+ (instancetype) prefWithKey:(NSString *) key defaultNumber:(NSNumber *) defaultValue;

- (void) setNumber:(NSNumber *) number;

- (NSNumber *) numberValue;

- (void) removeNumber;

@end

@interface TimestampPref : NSNumberPref

- (void) markNow;

- (void) reset;

- (BOOL) hasPast:(long long)duration;

- (long long) timestamp;

- (long long) age;
@end

@interface OSPref : NSObject
- (void) sync;
@end
