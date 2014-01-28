//
//  ViewController.m
//  webview-browser
//
//  Created by Devarajan on 31/10/13.
//  Copyright (c) 2013 Devarajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIActivityIndicatorView *activityIndicator;
}
@end

@implementation ViewController
@synthesize webview,urlText,googleText,searchText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self activityIndicator];
    
    NSString *googleurl = [NSString stringWithFormat:@"http://www.techdevmobile.com"];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)activityIndicator
{
    activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    activityIndicator.layer.cornerRadius = 05;
    activityIndicator.opaque = NO;
    activityIndicator.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
    activityIndicator.center = self.view.center;
    
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [activityIndicator setColor:[UIColor colorWithRed:0.6 green:0.8 blue:1.0 alpha:1.0]];
    [self.webview addSubview: activityIndicator];
    //[self.view addSubview:webview];
}

-(IBAction)goAction
{
    if (googleText)
    {
        if(googleText.text.length != 0)
        {
        NSString *googleurl = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",googleText.text];
        NSURL *url = [NSURL URLWithString:googleurl];
        NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestconn];
        [googleText resignFirstResponder];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Text to search" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];            
            [googleText resignFirstResponder];
        }
    }
    
    else if (urlText)
    {
        if(urlText.text.length != 0)
        {
        NSString *googleurl = [NSString stringWithFormat:@"http://%@",urlText.text];
        NSURL *url = [NSURL URLWithString:googleurl];
        NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
        [webview loadRequest:requestconn];
        [urlText resignFirstResponder];
        }
        else
        {
            UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter URL to search" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert2 show];
            [urlText resignFirstResponder];
            
        }
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
if([textField isEqual:urlText])
{
    googleText.text=nil;
}
    
else if ([textField isEqual:googleText])
{
    urlText.text = nil;
}
    
}
-(void)textFieldShouldReturn:(UITextField *)textField
{
    if([textField isEqual:urlText])
    {
        if(urlText.text.length != 0)
        {
            [self enterUrlText];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Url" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [urlText resignFirstResponder];
        }
    }

    else if ([textField isEqual:googleText])
    {
        if (googleText.text.length != 0)
        {
            [self enterGoogleText];
        }
    
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL Error" message:@"Please Enter Url" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [googleText resignFirstResponder];
        }

    }
}

-(void)enterUrlText
{
    NSString *googleurl = [NSString stringWithFormat:@"http://%@",urlText.text];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
    [urlText resignFirstResponder];

}

-(void)enterGoogleText
{
    NSString *googleurl = [NSString stringWithFormat:@"http://www.google.com/search?q=%@",googleText.text];
    NSURL *url = [NSURL URLWithString:googleurl];
    NSURLRequest *requestconn = [NSURLRequest requestWithURL:url];
    [webview loadRequest:requestconn];
    [googleText resignFirstResponder];
}

- (void)webViewDidStartLoad:(UIWebView *)webView;
{
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView;

{
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
     [activityIndicator stopAnimating];
}


@end
