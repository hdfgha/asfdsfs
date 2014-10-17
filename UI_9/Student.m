//
//  Student.m
//  UI_9
//
//  Created by Ibokan on 14-9-3.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize age,name;
-(void)encodeWithCoder:(NSCoder *)aCoder{
    NSLog(@"归档，开始编码");
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:address forKey:@"address"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    NSLog(@"反归档，开始解码");
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.age = [aDecoder decodeIntForKey:@"age"];
    self->address=[aDecoder decodeObjectForKey:@"address"];
    return self;
}
@end
