//
//  ECNewsViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 26/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECNewsViewController.h"
#import "SVProgressHUD.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import "FUIAlertView.h"
#import "UIColor+FlatUI.h"

@interface ECNewsViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *newsWebView;

@end

@implementation ECNewsViewController

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
	// Do any additional setup after loading the view.
    self.title = @"News";
    self.newsWebView.delegate = self;
    [self.newsWebView setOpaque:NO];
    self.newsWebView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash-background.png"]];
    
    [[self.newsWebView scrollView] setBounces:NO];
    //NSString *news = @"<span style='text-align:justify;font-family:Lato-Bold;font-size:16px;'><p><ul><li>Follow and participate in the weekly quiz to win attractive prizes</li><li>Do wait for our Endocon Mobile Apps - coming soon!</li><li>For more innovative ideas and updates - do wait for our Twitter and FB page- coming soon!</li></ul></p></span>";
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.endocon2014.com/api/mnews.php"]];
    [self.newsWebView loadRequest:req];
    //[self.newsWebView loadHTMLString:news baseURL:nil];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [SVProgressHUD showWithStatus:@"Loading.." maskType:SVProgressHUDMaskTypeGradient];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [ECConstants webRedColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
