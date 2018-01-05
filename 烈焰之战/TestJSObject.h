//
//  TestJSObject.h
//  烈焰之战
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "TestJSObject.h"

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

//首先创建一个实现了JSExport协议的协议
@protocol TestJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)TestNOParameter;
-(void)TestOneParameter:(NSString *)message;
//-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2 :(NSString *)message3;
@end

//让我们创建的类实现上边的协议
@interface TestJSObject : NSObject<TestJSObjectProtocol>

@end
