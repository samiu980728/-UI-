//
//  Student.m
//  OC 类的设计（二）班级类
//
//  Created by 萨缪 on 2018/6/11.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "Student.h"

@implementation Student

//构造方法 初始化学生对象
- (id)initWithName:(NSString *)name andNum:(NSInteger)num andScore:(NSInteger)score
{
    self = [super init];
    if (self){
        _name = name;
        _num = num;
        _score = score;
    }
    return self;
}

//getter方法 获得
- (NSString *)name//获取name
{
    return _name;
}

- (NSInteger)num//获取num
{
    return _num;
}

- (NSInteger)score//获取score
{
    return _score;
}


//setter方法 修改
- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setNum:(NSInteger)num
{
    _num = num;
}

- (void)setScore:(NSInteger)score
{
    _score =score;
}


//提供比较规则的方法 排序的方法
- (BOOL)isSortByScore:(Student *)aStudent
{
    //如果调用者 的分数大于 传入的分数
    if ([self score] > [aStudent score]){
        return NO;
    }
    return YES;
}

- (BOOL)isSortByNum:(Student *)aStudent
{
    if ([self num] > [aStudent num]){
        return YES;
    }
    return NO;
}

- (NSComparisonResult)isSortByName:(Student *)aStudent
{
    //比较学生的名字 然后返回compare方法的三个值之一 NSComparisonResult
    //注释掉的是升序方法
    //return [[self name] compare:[aStudent name]];
    NSComparisonResult ret = [[self name] compare:[aStudent name]];
    if (ret == NSOrderedDescending){
        return NSOrderedAscending;//当它是递减的时候 我们返回递增
    }
    else if (ret == NSOrderedAscending){
        return NSOrderedDescending;//当它是递增的时候 我们返回递减
    }
    else{
        return NSOrderedSame;
    }
}

//打印学生信息
- (void)printStudent
{
    NSLog(@"name = %@ num = %li score = %li",[self name],[self num],[self score]);
}



@end
