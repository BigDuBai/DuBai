//
//  Configure.m
//  DuBai
//
//  Created by darktm on 14-2-23.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "Configure.h"

#define base_url @"http://wei.qiaquan.com/qiaquan/index.php?"


@implementation Configure

+(NSString *)getLogin{

    return [base_url stringByAppendingString:@"app=appapi&mod=Passport&act=dologin"];
}

@end
