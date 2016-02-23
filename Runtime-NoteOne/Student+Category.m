//
//  Student+Category.m
//  Day2016-02-04
//
//  Created by NationSky on 16/2/5.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "Student+Category.h"
#import <objc/runtime.h>
@implementation Student (Category)
const char name;
- (void)setFirstName:(NSString *)firstName
{
    objc_setAssociatedObject(self, &name, firstName, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(NSString *)firstName
{
   return  objc_getAssociatedObject(self, &name);
}
@end
