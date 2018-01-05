//
//  GameApi.h
//  烈焰之战
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
#import "GameSdk.h"



//首先创建一个实现了JSExport协议的协议
@protocol GameApiJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)login;

//-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;
-(void)pay:(NSString *)orderid :(NSString *)goods :(NSString *) money :(NSString *) ext;

-(void)setdata:(NSString *)roleid :(NSString *)rolename :(NSString *) rolelevel :(NSString *) zoneid :(NSString *) zonename :(NSString *) rolecreatetime :(NSString *) type;

@end


@interface GameApi : NSObject<GameSdkLoginDelegate,GameSdkInitDelegate,GameSdkPayResultDelegate,GameApiJSObjectProtocol>
-(void)initSdk:(JSContext *) context;
@property JSContext *context;



@end
