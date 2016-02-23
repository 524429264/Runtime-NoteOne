//
//  Student.m
//  Day2016-02-04
//
//  Created by NationSky on 16/2/5.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "Student.h"
@implementation Student
- (void)eat{
    NSLog(@"%@吃饭了",self.name);
}

- (void)sleep{
    NSLog(@"%@睡觉了",self.name);
}
@end
