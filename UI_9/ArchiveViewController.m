//
//  ArchiveViewController.m
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "ArchiveViewController.h"
#import "Student.h"
@interface ArchiveViewController ()

@end

@implementation ArchiveViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)archiverAction:(id)sender {
    Student *stu1 = [[Student alloc] init];
    stu1->address = @"花果山";
    stu1.name = @"悟空";
    stu1.age = 800;
    
    Student *stu2 = [[Student alloc] init];
    stu2->address = @"高老庄";
    stu2.name = @"猪八戒";
    stu2.age= 9000;
    
    //生成归档器
    NSMutableData *data = [[NSMutableData alloc] init];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    //对对象进行归档
    [archiver encodeObject:stu1 forKey:@"stu1"];
    [archiver encodeObject:stu2 forKey:@"stu2"];
    [archiver finishEncoding];//完成编码
    
    //
    NSString *strPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"archiver.txt"];
    NSLog(@"strPath=%@",strPath);
    
    //
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:strPath]) {
        [fileManager createFileAtPath:strPath contents:nil attributes:nil];
    }
    //
    [data writeToFile:strPath atomically:YES];
    
}

- (IBAction)unarchiverAction:(id)sender {
    
     NSString *strPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"archiver.txt"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:strPath];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //开始归档 解码
    Student *stu1 = [unArchiver decodeObjectForKey:@"stu1"];
    Student *stu2 = [unArchiver decodeObjectForKey:@"stu2"];
    NSLog(@"%@,%@,%d",stu1.name,stu1->address,stu1.age);
    NSLog(@"%@,%@,%d",stu2.name,stu2->address,stu2.age);
    //反归档结束
    [unArchiver finishDecoding];
}
@end
