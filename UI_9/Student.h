//
//  Student.h
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
{
    @public
    NSString *address;//地址
}
@property (retain,nonatomic)NSString *name;//姓名
@property(assign,nonatomic)int age;
@end
