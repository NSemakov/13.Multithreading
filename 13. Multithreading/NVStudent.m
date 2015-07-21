//
//  NVStudent.m
//  13. Multithreading
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVStudent.h"
@interface NVStudent()
@end

@implementation NVStudent
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.result=^(NSString *name,double time, NSString* methodName) {
            
        //dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@ finished in %f from method %@",name,time,methodName);
        //});
            
        };
    }
    return self;
}
-(void) guessNumber:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock{
    __weak NVStudent* weakself=self;
    
    dispatch_queue_t queue=dispatch_queue_create("com.NikitaSemakov.Multithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        double startTime=CACurrentMediaTime();
        NSInteger guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        while (guess !=number) {
            guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        }
        
        resultBlock(weakself.name,CACurrentMediaTime()-startTime, @"guess1");

        
        
           });
    

}
-(void) guessNumber2:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock{
    __weak NVStudent* weakself=self;
    
    dispatch_queue_t queue=dispatch_queue_create("com.NikitaSemakov.Multithreading.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        double startTime=CACurrentMediaTime();
        NSInteger guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        while (guess !=number) {
            guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
       resultBlock(weakself.name,CACurrentMediaTime()-startTime,@"guess2");
        });
        
        
        //resultBlock(weakself.name,CACurrentMediaTime()-startTime,@"guess2");
    });
    
    
}
+(dispatch_queue_t) sharedQueue {
    static dispatch_queue_t queue;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue=dispatch_queue_create("com.NikitaSemakov.Multithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return queue;
    
}
-(void) guessNumber3:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock{
    __weak NVStudent* weakself=self;
    
    dispatch_queue_t queue=[NVStudent sharedQueue];
    dispatch_async(queue, ^{
        double startTime=CACurrentMediaTime();
        NSInteger guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        while (guess !=number) {
            guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        }
        
        resultBlock(weakself.name,CACurrentMediaTime()-startTime,@"guess3");
    });
    
    
}
@end
