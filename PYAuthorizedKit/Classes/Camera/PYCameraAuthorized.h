//
//  PYCameraAuthorized.h
//  PYScanViewController
//
//  Created by administrator on 2018/5/3.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PYCameraAuthorized : NSObject

+ (BOOL)authorized;

+ (AVAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted ,BOOL firstTime ))completion;

@end
