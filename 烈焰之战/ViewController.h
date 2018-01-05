//
//  ViewController.h
//  烈焰之战
//
//  Created by Apple on 2018/1/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JSContext.h>
#import <JavaScriptCore/JSManagedValue.h>
#import <JavaScriptCore/JSVirtualMachine.h>
#import <JavaScriptCore/JSExport.h>
#import "TestJSObject.h"
#import "GameApi.h"

@interface ViewController : UIViewController<UIWebViewDelegate> 

@property  UIWebView *mUiwebView;
@property JSContext *context;
@property GameApi *mGameApi;

@end

