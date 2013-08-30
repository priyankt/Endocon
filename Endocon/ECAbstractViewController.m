//
//  ECAbstractViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 21/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECAbstractViewController.h"
#import "UIColor+FlatUI.h"
#import "ECConstants.h"

@interface ECAbstractViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *abstractWebView;

@end

@implementation ECAbstractViewController

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
    [self configureUI];
}

- (void)configureUI
{
    self.title = @"Abstract";
    [self.abstractWebView setOpaque:NO];
    self.abstractWebView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]];
    //self.abstractWebView.backgroundColor = [UIColor colorFromHexCode:@"#c2eafb"];
    [[self.abstractWebView scrollView] setBounces:NO];
    [self.abstractWebView loadHTMLString:@"<span style='text-align:justify;font-family:Lato-Bold;font-size: 16px;'><p>First time in the history of Endocon, delegates will have an opportunity to showcase their research through poster presentations. Best three posters will receive awards. Abstract submission will start soon.</p><p>Do visit this section for further updates.</p></span>" baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
