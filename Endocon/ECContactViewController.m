//
//  ECContactViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 26/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECContactViewController.h"
#import "ECConstants.h"

@interface ECContactViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *contactWebView;

@end

@implementation ECContactViewController

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
    self.title = @"Contact";
    [self.contactWebView setOpaque:NO];
    [self.contactWebView.scrollView setBounces:NO];
    self.contactWebView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]];
    
    //[[self.contactWebView scrollView] setBounces:NO];
    NSString *contact = @"<span style='font-family:Lato-Regular;font-size:16px;'><h3 style='color:#FE0000;text-align:center;'>Conference Secretariat</h3><p><strong>Dr. Amol Bapaye</strong><br>Department of Digestive Diseases & Endoscopy,<br>Deenanath Mangeshkar Hospital & Research Center,Pune 411 004,<br>Maharashtra, India.<br><br><strong>Contact :</strong> Ms. Shivangi on +91 9921533381<br><strong>Telefax :</strong> +91 20 40151969<br><strong>Website : </strong><a href='http://endocon2014.com'>www.endocon2014.com</a><br><strong>Email : </strong><a href='mailto:endocon2014@gmail.com'>endocon2014@gmail.com</a></p><h3 style='color:#FE0000;text-align:center;'> Conference Event Manager</h3><p><strong>C/o VAMA EVENTS PVT. LTD</strong> <br>Office 4, Gr. Floor, Anmol CHS,<br>Sakharam Keer Marg,<br>Parallel to L. J. Road,<br>Mahim, Mumbai 400 016.<br><br><strong>Phone No : </strong> + 91 22 2438 3498<br><strong>Email : </strong><a href='mailto:vamahospitality@hotmail.com'>vamahospitality@hotmail.com</a></p></span>";
    
    [self.contactWebView loadHTMLString:contact baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
