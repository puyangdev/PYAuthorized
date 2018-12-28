//
//  PYHealthAuthorized.h
//  PYAuthorizedKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <HealthKit/HealthKit.h>

@interface PYHealthAuthorized : NSObject
+ (BOOL)authorized;

+ (BOOL)isHealthDataAvailable;

+ (HKAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
