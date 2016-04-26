//
// Created by liq on 5/12/14.
// Copyright (c) 2014 liq. All rights reserved.
//

#import "OSPref.h"

@interface BOOLPref()
@property (nonatomic, assign) BOOL defaultValue;
@property (nonatomic, copy) NSString *key;
@end

@implementation BOOLPref

+ (instancetype) prefWithKey:(NSString *) key {
    return [[self alloc] initWithKey:key defaultValue:NO];
}

+ (instancetype) prefWithKey:(NSString *) key defaultValue:(BOOL) defaultValue {
    return [[self alloc] initWithKey:key defaultValue:defaultValue];
}

- (id) initWithKey:(NSString *) key defaultValue:(BOOL) defaultValue {
    self = [super init];
    if (self) {
        _key = key;
        _defaultValue = defaultValue;
    }

    return self;
}

- (void) setBool:(BOOL) boolValue {
    [[NSUserDefaults standardUserDefaults] setObject:@(boolValue) forKey:self.key];
}

- (BOOL) boolValue {
    NSNumber *object = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (!object) {
        return self.defaultValue;
    }
    return [object boolValue];
}

@end

@interface NSStringPref()
@property (nonatomic, copy) NSString *defaultString;
@property (nonatomic, copy) NSString *key;
@end

@implementation NSStringPref

+ (instancetype) prefWithKey:(NSString *) key {
    return [[self alloc] initWithKey:key defaultString:nil];
}

+ (instancetype) prefWithKey:(NSString *) key defaultString:(NSString *) defaultString {
    return [[self alloc] initWithKey:key defaultString:defaultString];
}

- (instancetype) initWithKey:(NSString *) key defaultString:(NSString *) defaultString {
    self = [super init];
    if (self) {
        _key = [key copy];
        _defaultString = [defaultString copy];
    }

    return self;
}

- (void) setString:(NSString *) string {
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:self.key];
}

- (NSString *) stringValue {
    NSString *object = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (!object) {
        return self.defaultString;
    }
    return object;
}

- (void) removeString {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.key];
}

@end

@interface NSNumberPref()
@property (nonatomic, strong) NSNumber *defaultNumber;
@property (nonatomic, copy) NSString *key;
@end

@implementation NSNumberPref

+ (instancetype) prefWithKey:(NSString *) key {
    return [[self alloc] initWithKey:key defaultNumber:nil];
}

+ (instancetype) prefWithKey:(NSString *) key defaultNumber:(NSNumber *) defaultNumber {
    return [[self alloc] initWithKey:key defaultNumber:defaultNumber];
}

- (instancetype) initWithKey:(NSString *) key defaultNumber:(NSNumber *) defaultNumber {
    self = [super init];
    if (self) {
        _key = key;
        _defaultNumber = defaultNumber;
    }

    return self;
}

- (void) setNumber:(NSNumber *) number {
    [[NSUserDefaults standardUserDefaults] setObject:number forKey:self.key];
}

- (NSNumber *) numberValue {
    NSNumber *object = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (!object) {
        return self.defaultNumber;
    }
    return object;
}

- (void) removeNumber {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:self.key];
}

@end

@implementation TimestampPref

+ (long long) epochMilli:(NSDate *) date {
    return [@(date.timeIntervalSince1970) longLongValue] * 1000;
}

+ (instancetype) prefWithKey:(NSString *) key {
    return [[self alloc] initWithKey:key defaultNumber:@0];
}

- (void) markNow {
    [self setNumber:@([TimestampPref epochMilli:[NSDate date]])];
}

- (void) reset {
    [self setNumber:@0];
}

- (BOOL) hasPast:(long long) duration {
    return [self age] > duration;
}

- (long long) timestamp {
    return [[self numberValue] longLongValue];
}

- (long long) age {
    return [TimestampPref epochMilli:[NSDate date]] - [self timestamp];
}

@end

@implementation OSPref

- (void) sync {
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
