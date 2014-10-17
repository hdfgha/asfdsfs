//
//  SqliteViewController.h
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface SqliteViewController : UIViewController<UITextFieldDelegate>
{
    NSString *sqlitePath;//数据库文件路径
}
@property (strong, nonatomic) IBOutlet UITextField *textName;
@property (strong, nonatomic) IBOutlet UITextField *textSex;
@property (strong, nonatomic) IBOutlet UITextField *textAge;

- (IBAction)createTable:(id)sender;

- (IBAction)add:(id)sender;

- (IBAction)select:(id)sender;
- (IBAction)conditionSelect:(id)sender;
- (IBAction)update:(id)sender;
- (IBAction)deleteAction:(id)sender;


@end
