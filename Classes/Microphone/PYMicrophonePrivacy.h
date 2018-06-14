//
//  PYMicrophonePrivacy.h
//  PYPrivacyKit
//
//  Created by administrator on 2018/5/8.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface PYMicrophonePrivacy : NSObject

+ (BOOL)authorized;

+ (AVAudioSessionRecordPermission)authorizationStatus;

+ (void)authorizeWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion;

@end
