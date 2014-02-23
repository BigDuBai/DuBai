//
//  WYHttpTask.m
//  QiaQuan_Merchant
//
//  Created by tom on 13-8-3.
//  Copyright (c) 2013年 tom. All rights reserved.
//

#import "WYHttpTask.h"
#import "WYDatabase.h"

static NSMutableDictionary *g_mutableDictionary = nil;


@implementation WYHttpTask

@synthesize delegate = _delegate;

-(id)parese{


    return nil;
}

-(BOOL)bStoreLocalWithKey:(NSString *)key{
    
    WYDatabase *db = [WYDatabase shareInstance];
    
    NSData *result = [db queryBlobWithKey:key columnIndex:0];
    
    if(!result) return NO;
    
    _rcvData = [NSJSONSerialization JSONObjectWithData:result options:0 error:nil];

    DLog(@"%@",_rcvData);
    
    return YES;
}


-(void)startAsyncWithParams:(NSDictionary *)params withMethod:(NSString *)method withURL:(NSString *)url{
    
    NSString *dbKey = [[NSString stringWithFormat:@"%ud%@%@",[[params description] hash],[method description],[url description]] md5];
    
    if([self bStoreLocalWithKey:dbKey]){
        
        if([_delegate respondsToSelector:@selector(requestCompleteWithObj:)] && _delegate)
            [_delegate requestCompleteWithObj:self];
        
        return;
    }
    
    MKNetworkEngine *engine = [[MKNetworkEngine alloc] init];
    
    MKNetworkOperation *operation = [engine operationWithURLString:url params:params httpMethod:method];
    
    __weak id <WYHttpTaskDelegate> weakDelegate = self.delegate;
    
    NSString *engineKey = [NSString stringWithFormat:@"%ud",[engine hash]];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        
        _rcvData = [NSJSONSerialization JSONObjectWithData:[completedOperation responseData] options:0 error:nil];
        
        DLog(@"%@",_rcvData);//根据什么状态判断成功和失败   状态码或者是state
        
        //刷新页面
        if([weakDelegate respondsToSelector:@selector(requestCompleteWithObj:)] && weakDelegate)
            [weakDelegate requestCompleteWithObj:self];
        
        NSString *sql = [NSString stringWithFormat:@"delete from 'values' where 'key' = '%@';",dbKey];
        
        [[WYDatabase shareInstance] deleteWithSql:sql];
        
        [[WYDatabase shareInstance] insertWithValue:[completedOperation responseData] withKey:dbKey];
        
        [g_mutableDictionary removeObjectForKey:engineKey];
        
    } errorHandler:^(MKNetworkOperation *errorOp, NSError* error) {
        
        if([weakDelegate respondsToSelector:@selector(requestCompleteWithObj:)] && weakDelegate)
            [weakDelegate requestFailWithMsg:self];
        
        [g_mutableDictionary removeObjectForKey:engineKey];
    }];
    
    self.networkEngine = engine;
    self.networkOp = operation;
}

-(void)prepare{
    
//子类重写
    
}

-(void)start{

    [self prepare];
    
    if(!g_mutableDictionary){
        
        g_mutableDictionary = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    NSString *engineKey = [NSString stringWithFormat:@"%ud",[self.networkEngine hash]];
    
    [g_mutableDictionary setObject:self.networkEngine forKey:engineKey];
    
    [self.networkEngine enqueueOperation:self.networkOp forceReload:NO];
}

@end
