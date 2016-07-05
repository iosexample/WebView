//
//  DetailWKWebViewController.m
//  WebView
//
//  Created by Don on 16/7/4.
//  Copyright © 2016年 MAGICALBOY.COM. All rights reserved.
//

#import "DetailWKWebViewController.h"
#import <WebKit/WebKit.h>

@interface DetailWKWebViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation DetailWKWebViewController

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:(CGRect){0,0,[[UIScreen mainScreen] bounds].size}];
        _webView.navigationDelegate = self;
    }
    
    return _webView;
}

- (void)configureWebView {
    [self.view addSubview:self.webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://apple.com"]];
    [self.webView loadRequest:request];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureWebView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WKNavigationDelegate implements
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s, navigation:%@", __PRETTY_FUNCTION__, navigation);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"%s, navigation:%@", __PRETTY_FUNCTION__, navigation);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s, navigation:%@", __PRETTY_FUNCTION__, navigation);
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s, navigation:%@, error:%@", __PRETTY_FUNCTION__, navigation, error.localizedDescription);
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s, navigation:%@, error:%@", __PRETTY_FUNCTION__, navigation, error.localizedDescription);
}

@end
