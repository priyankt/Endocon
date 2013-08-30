//
//  ECScheduleTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 09/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECScheduleTableViewController.h"
#import "ECConstants.h"

@interface ECScheduleTableViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *scheduleWebView;

@end

@implementation ECScheduleTableViewController

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
    self.title = @"Program Highlights";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.scheduleWebView setOpaque:NO];
    [self.scheduleWebView.scrollView setBounces:NO];
    self.scheduleWebView.backgroundColor = [UIColor clearColor];
    
    //[[self.contactWebView scrollView] setBounces:NO];
    NSString *training = @"<span style='text-align:justify;font-family:Lato-Bold;font-size:16px;'><h3 style='color:#FE0000;text-align:center;'>Program Highlights</h3><p><ul><li>2 1⁄2 days of live transmission of basic & advanced endoscopy procedures</li><li>Renowned International faculty & National experts</li><li>Hands on training courses for EUS, ESD & POEM</li><li>Endoscopy Training Centre, breakfast sessions with experts, breakout sessions</li><li>Consensus statements, lectures, keynote address, symposia, debates</li><li>Ample opportunity for delegates to interact with experts</li><li>Focus on basic & advanced endoscopy – from beginners to experts</li><li>Added attractions – follow us on our website www.endocon2014.com</li></ul></p></span>";
    
    [self.scheduleWebView loadHTMLString:training baseURL:nil];
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
