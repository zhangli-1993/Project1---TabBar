//
//  AppDelegate.m
//  ProjectOne
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "AppDelegate.h"
#import "FiveViewController.h"
#import "OneViewController.h"
#import "FourViewController.h"
#import "ViewController.h"
#import "ThreeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
  
    FiveViewController *fiveVC = [[FiveViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:fiveVC];
    fiveVC.tabBarItem.title = @"肖楠";
    fiveVC.tabBarItem.image = [UIImage imageNamed:@"03-loopback.png"];


    UITabBarController *tab = [[UITabBarController alloc] init];
    OneViewController *oneVC = [[OneViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:oneVC];
    oneVC.tabBarItem.title = @"张莉";
    oneVC.tabBarItem.image = [UIImage imageNamed:@"105-piano.png"];
    
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:threeVC];
    threeVC.tabBarItem.title = @"聂欣欣";
    threeVC.tabBarItem.image = [UIImage imageNamed:@"08-chat.png"];
    
    FourViewController *fourVC = [[FourViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:fourVC];
    fourVC.tabBarItem.title = @"王晓奇";
    fourVC.tabBarItem.image = [UIImage imageNamed:@"05-shuffle.png"];
    
      
    ViewController *view = [[ViewController alloc]init];
    UINavigationController *nav =[[UINavigationController alloc]initWithRootViewController:view];
    
    view.tabBarItem.title = @"王妍";
    view.tabBarItem.image = [UIImage imageNamed:@"100-coffee.png"];
    
    tab.viewControllers = @[nav1, nav4, nav, nav3, nav5];
    tab.delegate = self;
    self.window.rootViewController = tab;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}



- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
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
