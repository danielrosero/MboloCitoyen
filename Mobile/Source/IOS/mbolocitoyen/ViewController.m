//
//  ViewController.m
//  mbolocitoyen
//
//  Created by Daniel Rosero on 14/11/17.
//  Copyright © 2017 danielrosero. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (nonatomic,strong) UIActivityIndicatorView *loadingView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   
    
    
    
    WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:theConfiguration];
    webView.navigationDelegate = self;
    NSURL *nsurl=[NSURL URLWithString:@"http://mbolocitoyen.org/"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [webView loadRequest:nsrequest];
    [self.view addSubview:webView];
    
    
    
    //    Loading view
    
    // Do any additional setup after loading the view.
    self.loadingView = [[UIActivityIndicatorView alloc]
                        initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    self.loadingView.center=self.view.center;
    
    
    self.loadingView.color=[UIColor colorWithRed:0.99 green:0.82 blue:0.29 alpha:1.0];;
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimating];
    
    //    ****
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self.loadingView stopAnimating];
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
[self.loadingView startAnimating];
    
}

//-(void) webViewDidFinishLoad:(UIWebView *)webView{
//
//    [self.loadingView stopAnimating];
//
//}
//
//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
//    if (navigationType == UIWebViewNavigationTypeLinkClicked ) {
//        [[UIApplication sharedApplication] openURL:[request URL]];
//        return NO;
//    }
//
//    return YES;
//}



@end
