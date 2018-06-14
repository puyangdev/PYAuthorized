//
//  PYNetWorkPrivacy.h
//  PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>

@interface PYNetWorkPrivacy : NSObject

+ (BOOL)authorized;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
