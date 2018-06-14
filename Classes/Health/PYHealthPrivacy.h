//
//  PYHealthPrivacy.h
//  PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface PYHealthPrivacy : NSObject
+ (BOOL)authorized;

+ (BOOL)isHealthDataAvailable;

+ (HKAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
