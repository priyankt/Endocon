//
//  ECWorkshopTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 09/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECWorkshopTableViewController.h"
#import "ECConstants.h"

@interface ECWorkshopTableViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *trainingWebView;

@end

@implementation ECWorkshopTableViewController

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
    
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]]];
    
    self.title = @"Hands-on Training";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.trainingWebView setOpaque:NO];
    [self.trainingWebView.scrollView setBounces:NO];
    self.trainingWebView.backgroundColor = [UIColor clearColor];
    
    //[[self.contactWebView scrollView] setBounces:NO];
    NSString *training = @"<span style='text-align:justify;font-family:Lato-Bold;font-size:16px;'><h3 style='color:#FE0000;text-align:center;'>Hands-on Training</h3><p>Delegates will get an opportunity to perform procedures hands-on on pig models and / or patients. Depending upon their area of interest, delegates will need to preregister for these courses. Courses will be available only by preregistration. No spot registrations will be entertained. Limited seats per workgroup - Hurry so as to avoid disappointment!</p><p>Workstations will be available for following procedures - <ol><li>Diagnostic UGI & LGI</li><li>Therapeutic UGI & LGI</li><li>ERCP</li><li>EUS</li><li>EMR, ESD & POEM</li></ol></p><p>For those who wish to register, please send an email to <a href='mailto:endocon2014@gmail.com'>endocon2014@gmail.com</a> for furthur details</p></span>";
    
    [self.trainingWebView loadHTMLString:training baseURL:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
