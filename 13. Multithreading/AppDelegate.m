//
//  AppDelegate.m
//  13. Multithreading
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "NVStudent.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Uchenik
    
    NVStudent* st1=[[NVStudent alloc]init];
    NVStudent* st2=[[NVStudent alloc]init];
    NVStudent* st3=[[NVStudent alloc]init];
    NVStudent* st4=[[NVStudent alloc]init];
    NVStudent* st5=[[NVStudent alloc]init];
    st1.name=@"Ivan";
    st2.name=@"Maria";
    st3.name=@"John";
    st4.name=@"Monpacie";
    st5.name=@"Morinel";
    NSArray *array=[NSArray arrayWithObjects:st1,st2,st3,st4,st5, nil];
    for (NVStudent* obj in array) {
        [obj guessNumber:50 lowerBound:0 upperBound:100 resultBlock:^(NSString *name, double time) {
        NSLog(@"%@ finished in %f",name,time);

        }];
    }
    
    //----------
    //end of Uchenik
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
