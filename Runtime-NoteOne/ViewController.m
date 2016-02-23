//
//  ViewController.m
//  Runtime-NoteOne
//
//  Created by NationSky on 16/2/23.
//  Copyright © 2016年 nsky. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Student+Category.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)ChangeVariable {
    
    Student *student = [Student new];
    student.name = @"乔布斯";
    NSLog(@"%@",student.name);
    
    
    unsigned int count;
    Ivar *ivar = class_copyIvarList([student class], &count);
    for (int i = 0; i< count; i++) {
        Ivar var = ivar[i];
        const char *varName = ivar_getName(var);
        NSString *name = [NSString stringWithCString:varName encoding:NSUTF8StringEncoding];
        if ([name isEqualToString:@"_name"]) {
            object_setIvar(student, var, @"Steve Jobs");
            break;
        }
    }
    
    NSLog(@"%@",student.name);
    
}


void happyNewYear(id self, SEL _cmd){
    NSLog(@"新年快乐");
}

- (IBAction)addMethod
{
    Student *student = [Student new];
    student.name = @"乔布斯";
    
    class_addMethod([student class], @selector(jump), (IMP)happyNewYear, "v@:");
    [student performSelector:@selector(jump)];
}

- (IBAction)addExtentionProperty
{
    Student *student = [Student new];
    student.name = @"乔布斯";
    
    NSLog(@"添加属性firstName结果前%@",student.firstName);
    
    student.firstName = @"Steve";
    NSLog(@"添加属性firstName结果:%@ ",student.firstName);
    
}

- (IBAction)exchangeMethod
{
    Student *student = [Student new];
    student.name = @"乔布斯";
    
    NSLog(@"交换方法前");
    [student eat];
    [student sleep];
    
    NSLog(@"----------交换方法实现-----------");
    Method m1 = class_getInstanceMethod([student class], @selector(eat));
    Method m2 = class_getInstanceMethod([student class], @selector(sleep));
    method_exchangeImplementations(m1, m2);
    
    [student eat];
    [student sleep];
}

@end
