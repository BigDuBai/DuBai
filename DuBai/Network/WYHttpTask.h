//
//  WYHttpTask.h
//  QiaQuan_Merchant
//
//  Created by tom on 13-8-3.
//  Copyright (c) 2013年 tom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKNetworkKit.h"
#import "Configure.h"


@class WYHttpTask;
@protocol WYHttpTaskDelegate <NSObject>

@required
-(void)requestCompleteWithObj:(WYHttpTask*)obj;

@optional
-(void)requestFailWithMsg:(WYHttpTask*)obj;

@end

@interface WYHttpTask : NSObject

@property (strong,nonatomic)id rcvData;

@property(assign,nonatomic)id<WYHttpTaskDelegate>delegate;

@property (strong,nonatomic)MKNetworkEngine *networkEngine;
@property (strong,nonatomic)MKNetworkOperation *networkOp;

-(void)startAsyncWithParams:(NSDictionary *)params withMethod:(NSString *)method withURL:(NSString *)url;

-(void)prepare;
-(void)start;

-(id)parese;

@end
