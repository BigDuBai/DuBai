//
//  WYDatabase.h
//  WYCategory
//
//  Created by tom on 13-12-5.
//  Copyright (c) 2013年 qiaquan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <sqlite3.h>

#import "WYCategory.h"

@interface WYDatabase : NSObject
{
    sqlite3 *_db;
    NSString *_dbPath;
    BOOL _isTransaction;
}

+(instancetype)shareInstance;

//+(instancetype)openDatabaseWitPath:(NSString*)aPath;

//+(instancetype)databaseWithPath:(NSString*)aPath;

-(instancetype)initWithPath:(NSString*)aPath;

-(BOOL)open;

-(BOOL)close;

-(BOOL)createTableWithObj:(id)aObj;

-(BOOL)createTableWithSql:(NSString *)aSql;

-(BOOL)insertWithSql:(NSString *)aSql;

-(BOOL)insertWithObjValue:(NSArray *)aValue tableName:(Class)className;

-(BOOL)deleteWithSql:(NSString *)aSql;

-(BOOL)updateWithSql:(NSString *)aSql;

-(NSMutableArray *)queryWithSql:(NSString *)aSql;

-(NSMutableArray *)queryObjWithClass:(Class)aClass;

-(NSMutableArray *)queryObjWithClass:(Class)aClass withSql:(NSString *)aSql;

-(NSMutableArray *)queryObjWithClass:(Class)aClass condition:(NSDictionary *)aCondition;

-(NSString *)queryWithSql:(NSString *)aSql columnIndex:(NSInteger)aIndex;

-(void)insertWithValue:(NSData *)aData withKey:(NSString *)aKey;

-(NSData*)queryBlobWithKey:(NSString *)aKey columnIndex:(NSInteger)aIndex;

-(sqlite_int64)lastInsertRowId;

-(BOOL)beginTransaction;

-(BOOL)commit;

-(BOOL)rollback;

@end