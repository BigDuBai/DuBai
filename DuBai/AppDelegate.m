//
//  AppDelegate.m
//  DuBai
//
//  Created by darktm on 14-2-20.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "AppDelegate.h"

#import "MasterViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "DDMenuController.h"
#import "SliderViewController.h"
#import "BaseNavigationViewController.h"

#import "WYDatabase.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LeftViewController *left = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LeftViewController"];
    RightViewController *right = [mainStoryBoard instantiateViewControllerWithIdentifier:@"RightViewController"];
    
    [SliderViewController sharedSliderController].LeftVC=left;
    [SliderViewController sharedSliderController].RightVC=right;
    [SliderViewController sharedSliderController].RightSContentOffset=260;
    [SliderViewController sharedSliderController].RightSContentScale=0.95;
    [SliderViewController sharedSliderController].RightSOpenDuration=0.8;
    [SliderViewController sharedSliderController].RightSCloseDuration=0.8;
    [SliderViewController sharedSliderController].RightSJudgeOffset=160;
    
    
    [SliderViewController sharedSliderController].LeftSContentOffset=260;
    [SliderViewController sharedSliderController].LeftSContentScale=0.95;
    [SliderViewController sharedSliderController].LeftSOpenDuration=0.8;
    [SliderViewController sharedSliderController].LeftSCloseDuration=0.8;
    [SliderViewController sharedSliderController].LeftSJudgeOffset=160;
    
    self.window.rootViewController = [[BaseNavigationViewController alloc] initWithRootViewController:[SliderViewController sharedSliderController]];;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    WYDatabase *db = [WYDatabase shareInstance];
    [db createTableWithSql:@"create table if not exists 'values' ('value' blob, 'key' TEXT);"];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    
    
    
    /*
     
     NSMutableArray *photos = [NSMutableArray arrayWithCapacity:count];
     for (int i = 0; i<count; i++) {
     // 替换为中等尺寸图片
     NSString *url = [_urls[i] stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
     MJPhoto *photo = [[MJPhoto alloc] init];
     photo.url = [NSURL URLWithString:url]; // 图片路径
     [photos addObject:photo];
     }
     
     // 2.显示相册
     MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
     browser.currentPhotoIndex = tap.view.tag; // 弹出相册时显示的第一张图片是？
     browser.photos = photos; // 设置所有的图片
     [browser show];
     
     */
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
