//
//  ECAboutTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECAboutTableViewController.h"
#import "ECAddressViewController.h"

#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"

@interface ECAboutTableViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *aboutWebView;
@property (weak, nonatomic) IBOutlet UILabel *organizersLabel;

@end

@implementation ECAboutTableViewController {
    CGFloat headerHeight;
    CGFloat footerHeight;
    UIImageView *imageView;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureUI];
}

- (void)configureUI
{
    self.title = @"About Endocon";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]]];
    self.tableView.backgroundView.contentMode = UIViewContentModeTopRight;
    
    self.organizersLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    self.organizersLabel.textColor = [ECConstants webRedColor];


    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[UIFont boldFlatFontOfSize:[ECConstants titleSize]]];
    
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setColor:[ECConstants webRedColor]];
    
    self.aboutWebView.opaque = NO;
    [[self.aboutWebView scrollView] setBounces:NO];
    [self.aboutWebView loadHTMLString:@"<span style='text-align:justify;font-family:Lato-Regular;font-size:16px;'><p>The eagerly awaited annual Endoscopy Fiesta will move to Pune next year! ENDOCON 2014 will be jointly hosted by Pune Society of Gastroenterology & Deccan Society of Gastrointestinal Endoscopists at <strong>JW Marriott, Pune on 14<sup>th</sup>, 15<sup>th</sup>& 16<sup>th</sup> March, 2014</strong>.</p><p>Our emphasis in this meeting will be to add value to your endoscopy practice. The vision of the meeting will be – <strong>“Endoscopy Vision 2020”</strong> (empowering every Indian endoscopist to establish quality endoscopy services). This will be showcased through interactive live courses, video lectures, single theme symposia, consensus statements & debates.</p></span>" baseURL:nil];
    /*
     <p>The success of a conference lies in meeting the learning objectives of the attendees and by their active participation. To ensure this fact, we invite inputs from participants so that the program can be so designed. We would attempt to address the practical difficulty of every endoscopist – beginner to expert. We have a distinguished panel of International & National faculty to assist us to meet these goals.</p><p>We look forward to hosting you at Pune in March next year! Do attend in large numbers and participate in the program!</p>
     */
    

    /*
    UIImage *footerImage = [UIImage imageNamed:@"organizedby.png"];
    imageView = [[UIImageView alloc] initWithImage:footerImage];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.tableView.tableFooterView = imageView;
     */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
