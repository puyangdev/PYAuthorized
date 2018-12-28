//
//  PYCalendarAuthorized.m
//  PYAuthorizedKit
//
//  Created by administrator on 2018/5/8.
//

#import "PYCalendarAuthorized.h"

@implementation PYCalendarAuthorized

+ (BOOL)authorized
{
    return [self authorizationStatus] == EKAuthorizationStatusAuthorized;
}

+ (EKAuthorizationStatus)authorizationStatus
{
    return  [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    EKAuthorizationStatus authorizationStatus =
    [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    
    switch (authorizationStatus) {
        case EKAuthorizationStatusAuthorized: {
            if (completion) {
                completion(YES, NO);
            }
        } break;
        case EKAuthorizationStatusNotDetermined:
        {
            EKEventStore *eventStore = [[EKEventStore alloc] init];
            [eventStore requestAccessToEntityType:EKEntityTypeEvent
                                       completion:^(BOOL granted, NSError *error) {
                                           if (completion) {
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                                   completion(granted,YES);
                                               });
                                           }
                                       }];
        }
            break;
        case EKAuthorizationStatusRestricted:
        case EKAuthorizationStatusDenied: {
            if (completion) {
                completion(NO, NO);
            }
        } break;
    }
}

@end
