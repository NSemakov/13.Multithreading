//
//  AppDelegate.m
//  13. Multithreading
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "NVStudent.h"
#import "NVStudentSophomore.h"
@interface AppDelegate ()
@property (strong,nonatomic) NSArray *arrayOfStudents;
@property (strong,nonatomic) NSArray *arrayOfNSOps;
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
    //NSArray *array=[NSArray arrayWithObjects:st1,st2,st3,st4,st5, nil];
    self.arrayOfStudents=[NSArray arrayWithObjects:st1,st2,st3,st4,st5, nil];
    for (NVStudent* obj in self.arrayOfStudents) {
        [obj guessNumber:50 lowerBound:0 upperBound:100 resultBlock:^(NSString *name, double time,NSString* methodName) {
        NSLog(@"%@ finished in %f in method %@",name,time,@"guess1");

        }];
    }
    
    //----------
    //end of Uchenik
    
    //Student
    
    for (NVStudent* obj in self.arrayOfStudents) {
        [obj guessNumber2:50 lowerBound:0 upperBound:100 resultBlock:obj.result];
    }
    
    //----------
    //end of Student
    
    //Master
    
    for (NVStudent* obj in self.arrayOfStudents) {
        [obj guessNumber3:50 lowerBound:0 upperBound:100 resultBlock:obj.result];
    }
    
    //----------
    //end of Master
    
    //Superman
    NSInteger upperBound=100;
    NSInteger lowerBound=0;
    NSInteger number=50;
    ResultBlock block=st1.result; //st1,st2... have the same block
    NVStudentSophomore *sts1=[[NVStudentSophomore alloc]initWithStudent:st1 upperBound:upperBound lowerBound:lowerBound number:number resultBlock:block];
    NVStudentSophomore *sts2=[[NVStudentSophomore alloc]initWithStudent:st2 upperBound:upperBound lowerBound:lowerBound number:number resultBlock:block];
    NVStudentSophomore *sts3=[[NVStudentSophomore alloc]initWithStudent:st3 upperBound:upperBound lowerBound:lowerBound number:number resultBlock:block];
    NVStudentSophomore *sts4=[[NVStudentSophomore alloc]initWithStudent:st4 upperBound:upperBound lowerBound:lowerBound number:number resultBlock:block];
    NVStudentSophomore *sts5=[[NVStudentSophomore alloc]initWithStudent:st5 upperBound:upperBound lowerBound:lowerBound number:number resultBlock:block];
    NSOperationQueue* q1=[[NSOperationQueue alloc]init];
    
    self.arrayOfNSOps=[NSArray arrayWithObjects:sts1,sts2,sts3,sts4,sts5, nil];
    for (NVStudentSophomore *obj in self.arrayOfNSOps){
        [q1 addOperation:obj];
    }
    //[q1 addOperation:sts1];
    //[q1 addOperation:self.sts1];
   /* self.sts1.name=@"vypusknik";
    [self.sts1 guessNumber3:50 lowerBound:0 upperBound:100 resultBlock:self.sts1.result];
    */
    
    NSOperationQueue* q2=[[NSOperationQueue alloc]init];
    [q2 addOperationWithBlock:^{
        NSLog(@"NSOperationQueue light");
    }];
    
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
