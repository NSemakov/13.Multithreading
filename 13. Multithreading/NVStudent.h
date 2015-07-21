//
//  NVStudent.h
//  13. Multithreading
//
//  Created by Admin on 21.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NVStudent : NSObject
@property (strong,nonatomic) NSString* name;

-(void) guessNumber:(NSInteger) number lowerBound:(NSInteger) lowerBound upperBound:(NSInteger) upperBound resultBlock:(void(^)(NSString* name, double time))resultBlock;
@end
