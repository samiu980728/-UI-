//
//  MyClass.m
//  OC 类的设计（二）班级类
//
//  Created by 萨缪 on 2018/6/11.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

//提供构造方法初始化班级类的对象
- (id)initWithClassName:(NSString *)className
{
    self = [super init];
    if (self)
    {
        _className = className;
        //还有一个可变数组对象 需要创建 对象不存在的话就没办法往数组中添加学生类的对象
        //所以 创建可变数组
        _stuList = [NSMutableArray array];
    }
    return self;
}

//setter方法
//修改班级名称
- (void)setClassName:(NSString *)className
{
   _className = className;
}

//getter方法
//读取班级名称
- (NSString *)className//获取我们的classname
{
    return _className;
}

//这个应该用不上
//添加学生
- (void)addStudent:(Student *)aStudent
{
    //把学生添加到上面创建的可变数组当中
    //先判断这个学生是否已经在可变数组当中 如果不包含传入对象 就把该对象添加进数组中
    if ( ![_stuList containsObject:aStudent] )
    {
        [_stuList addObject:aStudent];
    }
}

//这个应该用不上
//在指定下标位置添加一个学生
- (void)addStudent:(Student *)aStudent atIndex:(NSInteger)index
{
    //把学生添加到上面创建的可变数组当中
    //先判断这个学生是否已经在可变数组当中 如果不包含传入对象 就把该对象添加进数组中

    
    if ( ![_stuList containsObject:aStudent])
    {
        [_stuList insertObject:aStudent atIndex:index];
    }
}

//直接添加一个学生到最后一个位置
- (void)addStudentTolast
{
    NSLog(@"为您执行添加操作");
    NSLog(@"请输入学生信息");
    char NAME[10];
    NSLog(@"请输入姓名");
    scanf("%s",NAME);
    NSString * name = [NSString stringWithUTF8String:NAME];
    NSLog(@"请输入学号");
    NSInteger num;
    scanf("%li",&num);
    
    NSLog(@"请输入成绩");
    NSInteger score;
    scanf("%li",&score);
    Student * stu = [[Student alloc] initWithName:name andNum:num andScore:score];
    
    //判断
    if ([_stuList containsObject:stu]){
        NSLog(@"系统中已有该学生信息，请重新选择添加");
    }else{
    [_stuList addObject:stu];
        NSLog(@"该学生信息已添加，下面为您显示所有学生信息");
        [self showStuList];
    }
    
}

//添加学生到指定位置
- (void)addStudent
{
    //把学生添加到上面创建的可变数组当中
    //先判断这个学生是否已经在可变数组当中 如果不包含传入对象 就把该对象添加进数组中
    NSLog(@"为您执行添加学生到指定位置的操作");
    NSLog(@"请输入你想要添加的位置");
    NSInteger place;
    scanf("%li",&place);
    NSLog(@"请输入学生信息");
    char name[10];
    NSInteger num;
    NSInteger score;
    NSLog(@"请输入姓名");
    scanf("%s",name);
    NSString * numStr = [NSString stringWithUTF8String:name];
    NSLog(@"请输入学号");
    scanf("%li",&num);
    NSLog(@"请输入成绩");
    scanf("%li",&score);
    
    Student * stu = [[Student alloc] initWithName:numStr andNum:num andScore:score];
    
    if ( ![_stuList containsObject:stu])
    {
        
        [_stuList insertObject:stu atIndex:place];
    }
}

//删除学生
- (void)removeStudent:(Student *)aStudent
{
    [_stuList removeObject:aStudent];
}




//删除指定位置下标的学生
- (void)removeStudent:(Student *)aStudent atIndex:(NSInteger)index
{
    //删除之前先判断一下这个学生是否存在
    if ([aStudent isEqualTo:[_stuList objectAtIndex:index]]){
        [_stuList removeObjectAtIndex:index];
    }
}

//这个用不上
//替换指定位置的学生
- (void)replaceStudent:(Student *)aStudent atIndex:(NSInteger)index
{
    [_stuList replaceObjectAtIndex:index withObject:aStudent];
}

//遍历可变数组对象
- (void)showStuList
{
    //通过快速枚举法遍历可变数组对象
    for (Student *stu in _stuList) {
        [stu printStudent];
    }
}

//按学号升序
- (void)sortedByNumber
{
    //参数:sortedArrayUsingSelector:<#(nonnull SEL)#>
    //要求我们传入一个排序规则
    [_stuList sortedArrayUsingSelector:@selector(isSortByNum:)];
}

//按分数降序
- (void)sortedByScore
{
    [_stuList sortedArrayUsingSelector:@selector(isSortByScore:)];
}

//按名字降序
- (void)sortedByName
{
    [_stuList sortUsingSelector:@selector(isSortByName:)];
}

//通过姓名查找学生查找学生信息
- (void)findStuMsgByName
{
    NSLog(@"为您执行通过姓名查找学生信息的操作");
    
    NSLog(@"请输入学生姓名：");
    char a[10];
    scanf("%s",a);
    int i = 0;
    NSString * str = [NSString stringWithUTF8String:a];
    for (Student * stu in _stuList) {
        if ( [[stu name] isEqualToString:str] ){
            NSLog(@"以下为该学生信息");
            NSLog(@"name = %@ num = %ld score = %ld",[stu name],[stu num],[stu score]);
            i = 1;
            break;
        }
    }
    if (i == 0 ){
        NSLog(@"系统中没有该学生信息,请重新查找");
    }
}

//通过学号查找学生信息
- (void)findStuMsgByNum
{
    NSLog(@"为您执行通过姓名查找学生信息的操作");
    
    NSLog(@"请输入学生学号");
    NSInteger num;
    int i = 0;
    scanf("%li",&num);
    for (Student * stu in _stuList) {
        if ([stu num] == num){
            NSLog(@"以下为该生信息：");
            NSLog(@"name = %@ num = %ld score = %ld",[stu name],[stu num],[stu score]);
            i = 1;
            break;
        }
    }
    if (i==0){
        NSLog(@"系统中没有该学生信息,请重新查找");
    }
    
}

//删除指定学生
- (void)removeStudent
{
    NSLog(@"为您执行删除学生信息的操作");
    NSLog(@"请输入您想要删除的学生学号");
    NSInteger StuNum;
    scanf("%li",&StuNum);
    int i = 0;
    //还需要一个函数 通过学号查找学生
    //如果可以成功返回
    for (Student * stu in _stuList) {
        if ( StuNum == [stu num] ){
            [_stuList removeObject:stu];
            NSLog(@"已为您删除该生信息");
            NSLog(@"下面为您显示所有学生信息");
            [self showStuList];
            i = 1;
            break;
        }
    }
    if (i == 0){
        NSLog(@"系统中没有该学生，无法执行删除操作");
    }

    
}

//修改学生信息
- (void)changeStuMsg
{
    NSLog(@"以下为您执行修改学生信息的操作");
    NSLog(@"您要修改哪个学生的信息?请输入他的学号");
    NSInteger num;
    scanf("%li",&num);
    for (Student * stu in _stuList) {
        if (num == [stu num]){
            NSLog(@"以下为该学生信息");
            [stu printStudent];
            break;
        }
    }
    NSLog(@"请输入该生重新修改过后的信息");
    NSInteger newNum;
    char newN[10];
//    NSString * newName;
    NSInteger newScore;
    NSLog(@"请输入修改后的姓名");
    scanf("%s",newN);
    NSLog(@"请输入修改后的学号");
    scanf("%li",&newNum);
    NSLog(@"请输入修改后的成绩");
    scanf("%li",&newScore);
    NSLog(@"以下为该生重置后的信息");
    
    NSString * newName = [NSString stringWithUTF8String:newN];
    Student * newStu = [[Student alloc] initWithName:newName andNum:newNum andScore:newScore];
    NSLog(@"name = %@ num = %li score = %li",[newStu name],[newStu num],[newStu score]);
    
}


//类方法 测试Myclass当前类是否可用
+ (void)testMyClass
{
    //创建班级
    MyClass * iosClass = [[MyClass alloc] initWithClassName:@"iOS班级"];
    //创建学生 把学生添加进班级中去  假如要创建10个学生
    for ( NSInteger i = 0; i < 10; i++ ){
        //创建一个学生
        Student * stu = [[Student alloc]initWithName:[NSString stringWithFormat:@"stu%02d",arc4random()%50+1] andNum:arc4random()%100+1 andScore:arc4random()%101];
        //arc4random: 随机生成
        //将学生添加到班级中
        [iosClass addStudent:stu];
    }
    //创建完10个学生后 把学生 遍历打印输出一下
    NSLog(@"排序前:");
    [iosClass showStuList];
    
    //查找学生
    
    
    //下来通过name排序
    [iosClass sortedByName];
    NSLog(@"---name---降序：");
    [iosClass showStuList];
    
    [iosClass sortedByNumber];
    NSLog(@"---num---升序:");
    [iosClass showStuList];
    
    [iosClass sortedByScore];
    NSLog(@"---score--降序：");
    [iosClass sortedByScore];
    
    //[iosClass removeStudent];
//    Student * stu1 = [[Student alloc] initWithName:@"xiaoming" andNum:200 andScore:350];
//    [iosClass replaceStudent:stu1 atIndex:5];
//    [iosClass showStuList];
    //[iosClass findStuMsg];
    
    //添加指定位置学生
//    [iosClass addStudent];
//    [iosClass showStuList];
    //[iosClass addStudentTolast];
    //[iosClass findStuMsgByNum];
    [iosClass changeStuMsg];
}



@end
