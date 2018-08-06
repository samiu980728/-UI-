//
//  Student.h
//  OC 类的设计（二）班级类
//
//  Created by 萨缪 on 2018/6/11.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString * _name;
    NSInteger _num;
    NSInteger _score;
}

//构造方法 初始化学生对象
- (id)initWithName:(NSString *)name andNum:(NSInteger)num andScore:(NSInteger)score;

//getter方法 获得
- (NSString *)name;
- (NSInteger)num;
- (NSInteger)score;

//setter方法 修改
- (void)setName:(NSString *)name;
- (void)setNum:(NSInteger)num;
- (void)setScore:(NSInteger)score;

//提供比较规则的方法 排序的方法
- (BOOL)isSortByScore:(Student *)aStudent;
- (BOOL)isSortByNum:(Student *)aStudent;

- (NSComparisonResult)isSortByName:(Student *)aStudent;

//打印学生信息
- (void)printStudent;


////查找学生信息
//- (void)findStuMsg;

@end
