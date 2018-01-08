//
//  ViewController.m
//  烈焰之战
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
  

    
    _mGameApi=[GameApi new];
    
    
    //初始化webview
    _mUiwebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 22, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-22)];
    _mUiwebView.delegate=self;
    //添加webview到当前viewcontroller的view上
    [self.view addSubview:_mUiwebView];
    
    //网址
    //NSString *httpStr=@"http://danjiyou.duapp.com/Api/Yigui/gameapi";
   // NSString *httpStr=@"http://pulsdk.7724.com/bufanyouxi/loginback/game/jstl";
   // NSString *httpStr=@"http://bfres.xinaigame.com/enter.html?channel=bufanh5";
   // NSString *httpStr=@"http://pulsdk.7724.com/bufanyouxi/loginback/game/jstl";
     NSString *httpStr=@"http://open2829.game.4177.com/game/10433";
    NSURL *httpUrl=[NSURL URLWithString:httpStr];
    NSURLRequest *httpRequest=[NSURLRequest requestWithURL:httpUrl];
    
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    _context=[_mUiwebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    [_mGameApi initSdk:_context];
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    
    
    _context[@"GameApi"]=_mGameApi;
    
    [_mUiwebView loadRequest:httpRequest];
    // Do any additional setup after loading the view, typically from a nib.
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //网页加载之前会调用此方法
    
    NSString *requestString = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
   //if ([requestString hasPrefix:@"ios-log:"]) {
       // NSString* logString = [[requestString componentsSeparatedByString:@":#iOS#"] objectAtIndex:1];
        NSLog(@"JSLog ====\n %@", requestString);
    //}
    NSString *zhifubaostart1=[DgameUtils dencode:@"YWxpcGF5czovLw=="];//生成支付解密字符串
    NSLog(@"zhifubaostart1=：%@",zhifubaostart1);
    
    NSString *zhifubaostart2=[DgameUtils dencode:@"YWxpcGF5Oi8v"];//生成支付解密字符串
    NSLog(@"zhifubaostart2=：%@",zhifubaostart2);
    //
    NSString *zhifubaosuccess=[DgameUtils dencode:@"Ly9wYXlzdWNjZXNz"];//生成支付解密字符串
    NSLog(@"zhifubaosuccess=：%@",zhifubaosuccess);
    //d2VpeGluOi8v
    NSString *weixinstart=[DgameUtils dencode:@"d2VpeGluOi8v"];//生产支付微信解密字符串
    NSLog(@"weixinstart=：%@",weixinstart);
    //weixin://
    if ([requestString hasPrefix:zhifubaostart1] || [requestString hasPrefix:zhifubaostart2]) {
        BOOL bSucc = [[UIApplication sharedApplication]openURL:request.URL];
        NSLog(@"已经吊起支付");
        //bSucc是否成功调起支付宝
    }else if([requestString containsString:zhifubaosuccess]){
        NSLog(@"支付成功");
       // [[DgameSdk Instance] onPaySuccess:@"支付成功"];
        
    }else if([requestString containsString:weixinstart]){
        BOOL bSucc = [[UIApplication sharedApplication]openURL:request.URL];
        
    }
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //开始加载网页调用此方法
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //网页加载完成调用此方法
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    //JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    //NSString *alertJS=@"alert('test js OC')"; //准备执行的js代码
    //[context evaluateScript:alertJS];//通过oc方法调用js的alert
    
    //网页加载完成调用此方法
    
   
    
    //同样我们也用刚才的方式模拟一下js调用方法
    //NSString *jsStr1=@"testobject.TestNOParameter()";
    //[context evaluateScript:jsStr1];
    //NSString *jsStr2=@"testobject.TestOneParameter('参数1')";
    //[context evaluateScript:jsStr2];
    //NSString *jsStr3=@"testobject.TestTowParameterSecondParameter('参数A','参数B')";
    //[context evaluateScript:jsStr3];
    //NSString *jsStr4=@"testobject.TestTowParameterSecondParameter('参数A','参数B','参数3')";
   // [context evaluateScript:jsStr4];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //网页加载失败 调用此方法
}
@end
