//
// Created by Huang ChienShuo on 12/28/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSSystems : NSObject

+ (BOOL)isMinimumiOS11;

+ (BOOL)isMinimumiOS10;

+ (BOOL)isMinimumiOS9;

+ (BOOL)isMinimumiOS8;

+ (BOOL)isMinimumiOS7;

+ (BOOL)isMinimumiOS6;

+ (NSString *)systemVersion;

+ (void)newDevice;

+ (void)removeDevice;

+ (NSString *)deviceIdString;

+ (NSString *)UUIDString;

+ (NSString *)deviceModel;

+ (NSString *)countryCode;

+ (NSString *)mcc;

+ (NSString *)mnc;

+ (NSString *)icc;

+ (NSString *)currency;

+ (NSString *)preferredLocale;

+ (NSNumber *)timeZoneForPush;

+ (NSString *)locale;

+ (NSString *)appVersion;

+ (NSString *)build;

+ (NSString *)versionBuild;

+ (BOOL)isPhone;

+ (NSString *)machineName;

+ (BOOL)isMinimumiOSVersion:(NSString *) version;
@end