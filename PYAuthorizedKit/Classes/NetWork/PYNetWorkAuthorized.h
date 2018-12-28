//
//  PYNetWorkAuthorized.h
//  PYAuthorizedKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>

@interface PYNetWorkAuthorized : NSObject

+ (BOOL)authorized;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
