//
//  AppDelegate.m
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "ArchiveViewController.h"
#import "SqliteViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //获取app沙盒路径
    NSLog(@"%@",NSHomeDirectory());
    //获取主目录文件路径
    NSLog(@"%@",[[NSBundle mainBundle] bundlePath]);
    //获取ducument文件路径
    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]);
    
    //创建文件
    //文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件路径
    NSString *strPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"file1.txt"];
    //判断文件是否存在
    if (![fileManager fileExistsAtPath:strPath]) {
        [fileManager createFileAtPath:strPath contents:nil attributes:nil];
    }
    
    //将字符串写入到文件
    NSString *str = @"请请的你走了，就像你请请的的来，你会一会衣袖，不带走一片云彩。";
    NSError *error = nil;
    [str writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSMutableString *string = [NSMutableString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    [string appendString:@"作者：徐志摩"];
    [string writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    //读取文件
    NSString *strRead = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",strRead);
    
    //2复制文件
    NSString *destinationPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/file1副本.txt"];
    BOOL copyResult =[fileManager copyItemAtPath:strPath toPath:destinationPath error:nil];
    if (copyResult) {
        NSLog(@"文件复制成功");
    }
    
    //3.移动文件
    NSString *moveDestination = @"/Users/yf02/Desktop/file2/file1.txt";
    [fileManager moveItemAtPath:destinationPath toPath:moveDestination error:nil];
    
    //4.删除文件
    [fileManager removeItemAtPath:moveDestination error:nil];
    
    
    ArchiveViewController *archiver = [[ArchiveViewController alloc] init];
    UINavigationController *nav_archiver = [[UINavigationController alloc]initWithRootViewController:archiver];
    archiver.tabBarItem.title = @"归档";
    archiver.title = @"归档 反归档";
    
    
    SqliteViewController *sqlite = [[SqliteViewController alloc] init];
    UINavigationController *nav_sqlite = [[UINavigationController alloc] initWithRootViewController:sqlite];
    sqlite.title = @"FMDB数据库操作呢";
    sqlite.tabBarItem.title  =@"数据库";
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[nav_archiver,nav_sqlite];
    
    self.window.rootViewController = tabBarController;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
