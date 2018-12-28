//
//  PYRemindersAuthorized.m
//  PYAuthorizedKit
//
//  Created by administrator on 2018/5/8.
//

#import "PYRemindersAuthorized.h"

@implementation PYRemindersAuthorized
+ (BOOL)authorized
{
    return [self authorizationStatus] == EKAuthorizationStatusAuthorized;
}

+ (EKAuthorizationStatus)authorizationStatus
{
    EKAuthorizationStatus status =
    [EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder];
    return  status;
}

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    EKAuthorizationStatus status = [self authorizationStatus];
    
    switch (status) {
        case EKAuthorizationStatusAuthorized: {
            if (completion) {
                completion(YES, NO);
            }
        } break;
        case EKAuthorizationStatusNotDetermined:
        {
            EKEventStore *eventStore = [[EKEventStore alloc] init];
            [eventStore requestAccessToEntityType:EKEntityTypeReminder
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
