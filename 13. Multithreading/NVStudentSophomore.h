//
//  NVStudentSophomore.h
//  13. Multithreading
//
//  Created by Admin on 22.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "NVStudent.h"

@interface NVStudentSophomore : NSOperation

@property (strong,nonatomic) NVStudent *student;

- (instancetype)initWithStudent:(NVStudent*) stud upperBound:(NSInteger)upperBound lowerBound:(NSInteger)lowerBound number:(NSInteger)number resultBlock:(ResultBlock) result;


@end
