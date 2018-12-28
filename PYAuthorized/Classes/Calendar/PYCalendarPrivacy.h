//
// PYCalendarPrivacy.h
// PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

@interface PYCalendarPrivacy : NSObject

+ (BOOL)authorized;

+ (EKAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
