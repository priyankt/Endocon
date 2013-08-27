//
//  ECGurukulViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 21/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECGurukulViewController.h"
#import "UIFont+FlatUI.h"
#import "ECConstants.h"
#import "UIColor+FlatUI.h"

@interface ECGurukulViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *gurukulWebView;

@end

@implementation ECGurukulViewController

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
    self.title = @"Endoscopy Gurukul";
    [self.gurukulWebView setOpaque:NO];
    self.gurukulWebView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash-background.png"]];
    //self.gurukulWebView.backgroundColor = [UIColor colorFromHexCode:@"#c2eafb"];

    [[self.gurukulWebView scrollView] setBounces:NO];
    [self.gurukulWebView loadHTMLString:@"<span style='text-align:justify;font-family:Lato-Bold;font-size:16px;'><p>Gurukul derived from Sanskrit words <i>‘Guru’</i> meaning teacher or master and <i>‘kul’</i> meaning domain is a form of teaching/learning institution in India. It was considered as a school of traditional education.</p><p>Endoscopy Gurukul means a School of Endoscopy with experience from <i>‘Gurus’</i> in the field of endoscopy (learning’s of past and future advancements).</p><h3><span style='color:#FE0000;'>Activities</span></h3><p>Endoscopy Gurukul engages in the following activities:<ul><li>ProfEd: Physician Training Programs under Fellowship/ Observership</li><li>Educational initiatives for patient awareness & education, enrolling DM & DNB Students for Hands On, training budding physicians on BSC provided Tissue anatomy models</li><li>Conducting Technician Training Programs for enhancing technician skills on procedures, products, techniques, etc.</li></ul></p></span>" baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
