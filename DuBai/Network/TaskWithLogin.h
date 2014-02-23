//
//  TaskWithLogin.h
//  DuBai
//
//  Created by darktm on 14-2-23.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "WYHttpTask.h"

@interface TaskWithLogin : WYHttpTask

@property(nonatomic,strong)NSString* username;
@property(nonatomic,strong)NSString* pwd;

-(instancetype)initWithName:(NSString *)username withPwd:(NSString *)pwd;


@end
