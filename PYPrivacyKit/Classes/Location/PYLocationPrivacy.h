//
//  PYLocationPrivacy.h
//  PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PYLocationPrivacy : NSObject

+ (BOOL)isServicesEnabled;

+ (BOOL)authorized;

+ (CLAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
