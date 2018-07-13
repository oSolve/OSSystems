//
// Created by Huang ChienShuo on 12/28/13.
// Copyright (c) 2013 Liq. All rights reserved.
//

#import <CoreTelephony/CTCarrier.h>
#import <UIKit/UIKit.h>
#import "OSSystems.h"
#import "UICKeyChainStore.h"
#import <sys/utsname.h>

static NSString *const DeviceID = @"deviceId";

@implementation OSSystems

+ (NSDictionary *)machineNameMapper {
    return @{
      @"i386" : @" the simulator",
      @"iPod1,1" : @" iPod Touch",
      @"iPod2,1" : @" iPod Touch Second Generation",
      @"iPod3,1" : @" iPod Touch Third Generation",
      @"iPod4,1" : @" iPod Touch Fourth Generation",
      @"iPod5,1" : @" iPod Touch Fifth Generation",
      @"iPhone1,1" : @" iPhone",
      @"iPhone1,2" : @" iPhone 3G",
      @"iPhone2,1" : @" iPhone 3GS",
      @"iPad1,1" : @" iPad",
      @"iPad2,1" : @" iPad 2",
      @"iPad3,1" : @" 3rd Generation iPad",
      @"iPad3,2" : @" iPad 3(GSM+CDMA)",
      @"iPad3,3" : @" iPad 3(GSM)",
      @"iPad3,4" : @" iPad 4(WiFi)",
      @"iPad3,5" : @" iPad 4(GSM)",
      @"iPad3,6" : @" iPad 4(GSM+CDMA)",
      @"iPhone3,1" : @" iPhone 4",
      @"iPhone4,1" : @" iPhone 4S",
      @"iPhone5,1" : @" iPhone 5",
      @"iPad3,4" : @" 4th Generation iPad",
      @"iPad2,5" : @" iPad Mini",
      @"iPhone5,1" : @" iPhone 5(GSM)",
      @"iPhone5,2" : @" iPhone 5(GSM+CDMA)",
      @"iPhone5,3" : @"iPhone 5c(GSM)",
      @"iPhone5,4" : @" iPhone 5c(GSM+CDMA)",
      @"iPhone6,1" : @" iPhone 5s(GSM)",
      @"iPhone6,2" : @" iPhone 5s(GSM+CDMA)",
      @"iPhone7,1" : @" iPhone 6 Plus",
      @"iPhone7,2" : @" iPhone 6"
    };
}

+ (BOOL)isMinimumiOSVersion:(NSString *) version {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version);
}

+ (BOOL)isMinimumiOS11 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0");
}

+ (BOOL)isMinimumiOS10 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0");
}

+ (BOOL)isMinimumiOS9 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0");
}

+ (BOOL)isMinimumiOS8 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0");
}

+ (BOOL)isMinimumiOS7 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0");
}

+ (BOOL)isMinimumiOS6 {
    return SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0");
}

+ (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (void)newDevice:(NSString *) deviceIdString {
    [UICKeyChainStore setString:deviceIdString forKey:DeviceID service:[self bundleIDString]];
}

+ (NSString *)deviceIdString {
    return [UICKeyChainStore stringForKey:DeviceID service:[self bundleIDString]];
}

+ (NSString *)UUIDString {
    return [[NSUUID UUID] UUIDString];
}

+ (NSString *)bundleIDString {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)deviceModel {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return @"iPad";
    }
    return @"iPhone";
}

+ (NSString *)countryCode {
    NSLocale *currentLocale = [NSLocale currentLocale];
    return [currentLocale objectForKey:NSLocaleCountryCode];
}

+ (NSString *)mcc {
    CTCarrier *carrier = [[CTCarrier alloc] init];
    return [carrier mobileCountryCode] ? [carrier mobileCountryCode] : @"";
}

+ (NSString *)mnc {
    CTCarrier *carrier = [[CTCarrier alloc] init];
    return [carrier mobileNetworkCode] ? [carrier mobileNetworkCode] : @"";
}

+ (NSString *)icc {
    CTCarrier *carrier = [[CTCarrier alloc] init];
    return [carrier isoCountryCode] ? [carrier isoCountryCode] : @"";
}

+ (NSString *)currency {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    return [formatter currencyCode];
}

+ (NSString *)preferredLocale {
    NSArray *langs = [NSLocale preferredLanguages];

    return langs.count > 0 ? langs[0] : nil;
}

+ (NSNumber *)timeZoneForPush {
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    return [NSNumber numberWithInteger:(currentTimeZone.secondsFromGMT / 60)];
}

+ (NSString *)locale {
    NSLocale *currentLocale = [NSLocale currentLocale];  // get the current locale.
    NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];

    NSString *language = [[NSLocale preferredLanguages] objectAtIndex:0];

    if (countryCode && language) {
        return [NSString stringWithFormat:@"%@_%@", language, countryCode];
    }
    return @"";
}

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)build {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *) kCFBundleVersionKey];
}

+ (NSString *)versionBuild {
    NSString *version = [self appVersion];
    NSString *build = [self build];

    NSString *versionBuild = [NSString stringWithFormat:@"v%@", version];

    if (![version isEqualToString:build]) {
        versionBuild = [NSString stringWithFormat:@"%@(%@)", versionBuild, build];
    }

    return versionBuild;
}

+ (BOOL)isPhone {
    return UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad;
}

+ (NSString *)machineName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *result = [NSString stringWithCString:systemInfo.machine
                                          encoding:NSUTF8StringEncoding];
    NSString *name = [self machineNameMapper][result];
    return !name || name.length == 0 ? @"unknown" : name;
}
@end