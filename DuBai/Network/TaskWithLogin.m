//
//  TaskWithLogin.m
//  DuBai
//
//  Created by darktm on 14-2-23.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "TaskWithLogin.h"

@implementation TaskWithLogin


-(instancetype)initWithName:(NSString *)username withPwd:(NSString *)pwd{

    self = [super init];
    
    self.username = username;
    self.pwd = pwd;  
    
    return self;
}

-(void)prepare{
    
    NSMutableDictionary *mDic = [NSMutableDictionary dictionaryWithCapacity:3];
    [mDic setValue:self.username forKey:@"login_email"];
    [mDic setValue:self.pwd forKey:@"login_password"];
    [mDic setValue:@"2" forKey:@"type"];
    
    [self startAsyncWithParams:mDic withMethod:@"POST" withURL:[Configure getLogin]];
}

-(id)parese{
    
    return self.rcvData;
}

@end
