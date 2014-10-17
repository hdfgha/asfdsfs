//
//  SqliteViewController.m
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "SqliteViewController.h"

@interface SqliteViewController ()

@end

@implementation SqliteViewController
@synthesize textAge,textName,textSex;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    sqlitePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"school.db"];
    textName.delegate =self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//建表
- (IBAction)createTable:(id)sender {
    //打开数据库(如果数据库文件不存在则创建文件,如果数据库文件存在则打开已有数据库文件)
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath];
    //判断数据库打开是否成功
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //创建表
    BOOL createResult = [database executeUpdate:@"create table class15(name text,sex text,age integer)"];
    if (createResult) {
        NSLog(@"表class15创建成功");
    }
    
    //关闭数据库
    [database close];
}
//插入
- (IBAction)add:(id)sender {
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath];
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //数据插入
    BOOL insertResult = [database executeUpdate:@"insert into class15 values(?,?,?)",textName.text,textSex.text,textAge.text];
    if (insertResult) {
        NSLog(@"数据插入成功");
    }
    [database close];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [textName resignFirstResponder];
    
}
//查询所有
- (IBAction)select:(id)sender {
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath];
    
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    //查询所有数据
    FMResultSet *resultSet = [database executeQuery:@"select * from class15"];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *sex = [resultSet stringForColumn:@"sex"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"name=%@,sex=%@,age=%d",name,sex,age);
    }
    [database close];
}
//条件查询
- (IBAction)conditionSelect:(id)sender {
    //
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath
                            ];
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    FMResultSet *resultSet = [database executeQuery:@"select * from class15 where age > 10 and age < 11"];
    while ([resultSet next]) {
        NSString *name = [resultSet stringForColumn:@"name"];
        NSString *sex = [resultSet stringForColumn:@"sex"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"name=%@,sex=%@,age=%d",name,sex,age);
    }
    [database close];
}
//更改数据
- (IBAction)update:(id)sender {
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath
                            ];
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    //更改数据
    BOOL updateResult = [database executeUpdate:@"update class15 set age = ? where name = ?",@"15",@"jiajia"];
    if (updateResult) {
        NSLog(@"数据更新成功");
    }
    [database close];
}
//删除
- (IBAction)deleteAction:(id)sender {
    FMDatabase *database = [FMDatabase databaseWithPath:sqlitePath
                            ];
    if (![database open]) {
        NSLog(@"数据库打开失败");
        return;
    }
    BOOL deleteResult = [database executeUpdate:@"delete from class15 where name = ?",@"jiajia"];
    if (deleteResult) {
        NSLog(@"数据删除成功");
    }
    [database close];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
