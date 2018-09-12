//
//  ViewController.m
//  WKWebView
//
//  Created by shenyi on 2018/9/12.
//  Copyright © 2018年 shenyi. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.frame = self.view.frame;
    [self.view addSubview:self.webView];
}

#pragma mark - WKNavigationDelegate
- dids

- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:config];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
    }
    return _webView;
}


@end
