//
// Created by Huang ChienShuo on 12/28/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_VERSION_EQUAL_TO(v)                  ([[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] compare:v options:NSNumericSearch] == NSOrderedSame)
#define APP_VERSION_GREATER_THAN(v)              ([[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define APP_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define APP_VERSION_LESS_THAN(v)                 ([[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]compare:v options:NSNumericSearch] == NSOrderedAscending)
#define APP_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface OSSystems : NSObject

+ (BOOL)isMinimumiOS11;

+ (BOOL)isMinimumiOS10;

+ (BOOL)isMinimumiOS9;

+ (BOOL)isMinimumiOS8;

+ (BOOL)isMinimumiOS7;

+ (BOOL)isMinimumiOS6;

+ (NSString *)systemVersion;

+ (void)newDevice:(NSString *) deviceIdString;

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