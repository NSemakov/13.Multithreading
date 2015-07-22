//
//  NVStudent.h
//  13. Multithreading
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ResultBlock)(NSString* name, double time, NSString* methodName);

@interface NVStudent : NSObject
@property (strong,nonatomic) NSString* name;
@property (copy,nonatomic) ResultBlock result;

-(void) guessNumber:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock;
-(void) guessNumber2:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock;
-(void) guessNumber3:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(ResultBlock)resultBlock;
@end
