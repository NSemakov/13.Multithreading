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

-(void) guessNumber:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(void(^)(NSString* name, double time))resultBlock{
    __weak NVStudent* weakself=self;
    
    dispatch_queue_t queue=dispatch_queue_create("com.NikitaSemakov.Multithreading.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        double startTime=CACurrentMediaTime();
        NSInteger guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        while (guess !=number) {
            guess=arc4random_uniform((unsigned int)upperBound-(unsigned int)lowerBound+1);
        }
        
        resultBlock(weakself.name,CACurrentMediaTime()-startTime);
           });
    

}

@end
