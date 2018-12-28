//
//  PYPhotosAuthorized.h
//  PYScanViewController
//
//  Created by administrator on 2018/5/3.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>

@interface PYPhotosAuthorized : NSObject

+ (BOOL)authorized;

+ (PHAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
