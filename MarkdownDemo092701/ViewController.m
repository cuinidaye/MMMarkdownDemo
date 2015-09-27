//
//  ViewController.m
//  MarkdownDemo092701
//
//  Created by Cuifengchuan on 15/9/27.
//  Copyright © 2015年 cuifengchuan. All rights reserved.
//

#import "ViewController.h"
#import <MMMarkdown/MMMarkdown.h>


@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

- (IBAction)btnAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myWebView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btnAction:(id)sender {
    /**
     * MMMarkdown在解析代码片段（即```）时会出现问题，或者说根本没有解析。
     */
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"code" ofType:@"txt"];

    NSString * path = [[NSBundle mainBundle] pathForResource:@"article" ofType:@"txt"];
    NSURL * fileUrl = [NSURL fileURLWithPath:path];
    NSString * markdownStr = [NSString stringWithContentsOfURL:fileUrl encoding:NSUTF8StringEncoding error:nil];
    NSString * htmlString = [MMMarkdown HTMLStringWithMarkdown:markdownStr error:nil];
    [_myWebView loadHTMLString:htmlString baseURL:nil];
}

# pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"shouldStartLoadWithRequest : %@", request);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    NSLog(@"didFailLoadWithError : %@", error);
}

@end
