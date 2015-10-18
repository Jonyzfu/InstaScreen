//
//  AppDelegate.m
//  InstaScreen
//
//  Created by Jony Fu on 10/15/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "PhotosViewController.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
    if (token != nil) {
        PhotosViewController *photoVC = [[PhotosViewController alloc] init];
        self.navigation = [[UINavigationController alloc] initWithRootViewController:photoVC];
        NSLog(@"1");
        [_window setRootViewController:self.navigation];
    } else {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        NSLog(@"2");
        [_window setRootViewController:loginVC];
    }
    [_window setBackgroundColor:[UIColor colorWithRed:0.867 green:0.902 blue:0.929 alpha:1.000]];
    [_window makeKeyAndVisible];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    return YES;
}



-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation {
    NSString *accessToken = [url fragment];
    NSArray *array = [accessToken componentsSeparatedByString:@"="];
    NSString *token = [array objectAtIndex:1];
    NSLog(@"Token: %@", token);
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"token"];
    
    if (token != nil) {
        PhotosViewController *photoVC = [[PhotosViewController alloc] init];
        self.navigation = [[UINavigationController alloc] initWithRootViewController:photoVC];
        [_window setRootViewController:self.navigation];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login Error" message:@"Please login with your Instagram account." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        }];
        [alert addAction:action];
        [_window.rootViewController presentViewController:alert animated:YES completion:nil];
    }
                                     
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
