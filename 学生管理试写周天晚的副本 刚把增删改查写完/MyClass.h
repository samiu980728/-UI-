//
//  MyClass.h
//  OC 类的设计（二）班级类
//
//  Created by 萨缪 on 2018/6/11.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <Foundation/Foundation.h>
//添加学生需要用到Student类
#import "Student.h"
@interface MyClass : NSObject
{
    NSString * _className;
    NSMutableArray * _stuList;
}
//提供构造方法初始化班级类的对象
- (id)initWithClassName:(NSString *)className;

//setter方法
- (void)setClassName:(NSString *)className;

//getter方法
- (NSString *)className;//获取我们的classname

//添加学生
- (void)addStudent:(Student *)aStudent;

//在指定下标位置添加一个学生
- (void)addStudent:(Student *)aStudent atIndex:(NSInteger)index;

//删除学生
- (void)removeStudent:(Student *)aStudent;

//删除指定位置下标的学生
- (void)removeStudent:(Student *)aStudent atIndex:(NSInteger)index;

//替换指定位置的学生
- (void)replaceStudent:(Student *)aStudent atIndex:(NSInteger)index;

//遍历可变数组对象
- (void)showStuList;

//按学号升序
- (void)sortedByNumber;

//按分数降序
- (void)sortedByScore;

//按名字降序
- (void)sortedByName;

//类方法 测试Myclass当前类是否可用
+ (void)testMyClass;

//通过姓名查找学生信息
- (void)findStuMsgByName;

//通过学号查找学生信息
- (void)findStuMsgByNum;

//在指定位置添加学生
- (void)addStudent;

//删除指定学生
- (void)removeStudent;

//直接添加一个学生到最后一个位置
- (void)addStudentTolast;

- (void)changeStuMsg;

@end
