//
//  NVStudentSophomore.m
//  13. Multithreading
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVStudentSophomore.h"
#import "NVStudent.h"
@interface NVStudentSophomore ()
@property (assign,nonatomic) NSInteger low;
@property (assign,nonatomic) NSInteger upper;
@property (copy,nonatomic) ResultBlock result;
@property (assign,nonatomic) NSInteger number;
@end

@implementation NVStudentSophomore
- (instancetype)initWithStudent:(NVStudent*) stud upperBound:(NSInteger)upperBound lowerBound:(NSInteger)lowerBound number:(NSInteger)number resultBlock:(ResultBlock) result
{
    self = [super init];
    if (self) {
        self.student=stud;
        self.low=lowerBound;
        self.upper=upperBound;
        self.result=result;
        self.number=number;
    }
    return self;
}
+(NSOperationQueue*) sharedQueue {
    static NSOperationQueue* queue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue=[[NSOperationQueue alloc]init];
    });
    return queue;
}
-(void) main {
    @autoreleasepool {
        NSLog(@"hi");
        
        NVStudent *weakStudent=self.student;
        double startTime=CACurrentMediaTime();
        NSInteger guess=arc4random_uniform((unsigned int)self.upper-(unsigned int)self.low+1);
        while (guess !=self.number) {
            guess=arc4random_uniform((unsigned int)self.upper-(unsigned int)self.low+1);
        }
        
        self.result(weakStudent.name,CACurrentMediaTime()-startTime,NSStringFromSelector(@selector(main)));
        
    }
    
}

@end
