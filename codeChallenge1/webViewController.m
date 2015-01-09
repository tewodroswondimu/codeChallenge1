//
//  webViewController.m
//  codeChallenge1
//
//  Created by Tewodros Wondimu on 1/9/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Navigation item title displays the answer from the previous multiplication
    self.navigationItem.title = [NSString stringWithFormat:@"%i", self.answer];

    // The webViewDisplays the Mobile Makers Academy Webpage
    NSString *webPageURLString = @"http://www.mobilemakers.co";
    NSURL *webPageURL = [NSURL URLWithString:webPageURLString];
    NSURLRequest *webPageURLRequest = [NSURLRequest requestWithURL:webPageURL];
    [self.webView loadRequest:webPageURLRequest];

    // Sets the delegate to self and hides the activity indicator
    self.webView.delegate = self;
    self.activityIndicator.hidden = true;
}

// When web view starts to load show the activity indicator and start animating it
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidden = false;
}

// When the view finished loading stop animating the activity indicator and hide it.
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = true;
}

@end
