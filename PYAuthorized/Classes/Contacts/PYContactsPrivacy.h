//
//  PYContactsPrivacy.h
//  PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <Contacts/Contacts.h>

@interface PYContactsPrivacy : NSObject
+ (BOOL)authorized;

+ (NSInteger)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;
@end
