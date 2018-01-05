//
//  GameApi.m
//  烈焰之战
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GameApi.h"

@implementation GameApi



-(void)initSdk:(JSContext *) context{
    [[GameSdk Instance] GameSdkinitSDKWithListener:self];
    _context=context;
}


//此处我们测试几种参数的情况
-(void)login{
    [[GameSdk Instance] GameSdklogin:@"传奇世界" withLoginListener:self];

}

//-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;
-(void)pay:(NSString *)orderid :(NSString *)goods :(NSString *) money :(NSString *) ext{
        [[GameSdk Instance] GameSdkpay:money andName:goods andExtinfo:ext andOrderid:orderid withPayListener:self];
}

-(void)setdata:(NSString *)roleid :(NSString *)rolename :(NSString *) rolelevel :(NSString *) zoneid :(NSString *) zonename :(NSString *) rolecreatetime :(NSString *) type{
    
    NSDictionary *parametersDemo = @{@"roleId":roleid,@"roleName":rolename,@"roleLevel":rolelevel,@"zoneId":zoneid,@"zoneName":zonename};
    NSString *string=[DgameUtils dictionaryToJson:parametersDemo];
    NSLog(@"webview设置玩家数据=%@",string);
    [[GameSdk Instance] GameSdksetRoleData:string];

}


-(void) onResponse:(NSString *) tag andResponsewhy:(NSString *) value{
    NSLog(@"初始化回掉代理。占时无作用，只是作为sdk的通知%@",tag);
}

-(void) onLoginSuccess:(DgameUser *) user andreason:(NSString *) remain{
    NSString *str=@"登录成功";
    NSLog(@"我在gamesdk中登录成功%@",[str stringByAppendingString:user.userid]);
    //NSDictionary *userinfo = @{@"uid":user.userid,@"username":user.username,@"token":user.token};
    
   // NSString *userjson=[DgameUtils dictionaryToJson:userinfo];
    NSString *jsStr1=@"GameCallBack.loginSuc({'uid' : '";
    NSString *jsStr2=user.userid;
    NSString *jsStr3=@"','username' : '";
    NSString *jsStr4=user.username;
    NSString *jsStr5=@"','token' : '";
    NSString *jsStr6=user.token;
    NSString *jsStr7=@"'})";



    NSString *str2= [[NSString alloc] initWithFormat:@"%@%@%@%@%@%@%@",jsStr1,jsStr2,jsStr3,jsStr4,jsStr5,jsStr6,jsStr7];
    NSLog(@"str=%@",str2);
   // NSString *alertJS=@"GameCallBack.loginSuc({'uid' : '1924378902051191909','username' : 'C323049451','token' : 'fe8433123da84dd2e8b7f15e7ebe9b4f'})"; //准备执行的js代码
    [_context evaluateScript:str2];//通过oc方法调用js的alert
    //[_context evaluateScript:str2];
    }


-(void) onLoginFailed:(NSString *) why andreason:(NSString *) remain{
    NSLog(@"登录失败%@",why);
     NSString *str=@"GameCallBack.loginFail()"; //准备执行的js代码
     NSLog(@"登录失败str=%@",str);
    [_context evaluateScript:str];
    
}

-(void) onLoginOut:(NSString *) remain{
    //sdk里的切换账号。游戏收到此代理，应该退出游戏到登录页面
    NSLog(@"登出%@",remain);
    NSString *str=@"GameCallBack.loginOut()"; //准备执行的js代码
    NSLog(@"str=%@",str);
    [_context evaluateScript:str];
}


-(void) onSuccess : (NSString*) msg{
    NSLog(@"Viewcontrollerzhong支付成功%@",msg);
    NSString *str=@"GameCallBack.paySuc()"; //准备执行的js代码
    NSLog(@"str=%@",str);
    [_context evaluateScript:str];
    //[DgameUtils showMessage:msg];
}//支付成功回调

-(void) onFailed : (NSString*) msg{
    NSLog(@"Viewcontrollerzhong支付失败");
    NSString *str=@"GameCallBack.payFail()"; //准备执行的js代码
    NSLog(@"str=%@",str);
    [_context evaluateScript:str];
}//支付失败回调


@end
