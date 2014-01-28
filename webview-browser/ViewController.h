//
//  ViewController.h
//  webview-browser
//
//  Created by Devarajan on 31/10/13.
//  Copyright (c) 2013 Devarajan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) IBOutlet UITextField *googleText;
@property (strong, nonatomic) IBOutlet UITextField *urlText;
@property (strong, nonatomic) NSMutableString *searchText;

-(IBAction) goAction;


@end
