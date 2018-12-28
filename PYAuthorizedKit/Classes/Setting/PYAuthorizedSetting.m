//
//  PYAuthorizedSetting.m
//  PYAuthorizedKit
//
//  Created by administrator on 2018/5/8.
//

#import "PYAuthorizedSetting.h"

@implementation PYAuthorizedSetting

+ (void)displayAppAuthorizedSettings
{
    if (@available(iOS 8,*))
    {
        NSURL *appSettings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        
        if (@available(iOS 10,*)) {
            [[UIApplication sharedApplication]openURL:appSettings options:@{} completionHandler:^(BOOL success) {
            }];
        }
        else
        {
            [[UIApplication sharedApplication]openURL:appSettings];
        }
    }
}

+ (void)showAlertToDislayAuthorizedSettingWithTitle:(NSString*)title msg:(NSString*)message cancel:(NSString*)cancel setting:(NSString *)setting
{
    if (@available(iOS 8,*)) {
        
        UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        //cancel
        UIAlertAction *action = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        [alertController addAction:action];
        //ok
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:setting style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [self displayAppAuthorizedSettings];
        }];
        [alertController addAction:okAction];
        
        [[self currentTopViewController] presentViewController:alertController animated:YES completion:nil];
    }
}

+ (UIViewController*)currentTopViewController
{
    UIViewController *currentViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    while ([currentViewController presentedViewController])    currentViewController = [currentViewController presentedViewController];
    
    if ([currentViewController isKindOfClass:[UITabBarController class]]
        && ((UITabBarController*)currentViewController).selectedViewController != nil )
    {
        currentViewController = ((UITabBarController*)currentViewController).selectedViewController;
    }
    
    while ([currentViewController isKindOfClass:[UINavigationController class]]
           && [(UINavigationController*)currentViewController topViewController])
    {
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    }
    
    return currentViewController;
}

@end
