//
//  ECFacultyTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECFacultyTableViewController.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "ECFacultyViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ECFacultyTableViewController ()

@end

@implementation ECFacultyTableViewController {
    NSArray *faculty;
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
    self.title = @"Faculty";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]]];
    
    faculty = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Dr. Pinghong Zhou",@"subtitle":@"China"}, @{@"image":@"",@"title":@"Dr. Shyam Varadarajulu",@"subtitle":@"USA"}, @{@"image":@"",@"title":@"Prof. Akihiro Araki",@"subtitle":@"Japan"}, @{@"image":@"",@"title":@"Prof. Ram Chuttani",@"subtitle":@"USA"}, @{@"image":@"",@"title":@"Prof. Kapil Gupta",@"subtitle":@"USA"}, @{@"image":@"",@"title":@"Prof. Pradermchai Kongkam",@"subtitle":@"Thailand"}, @{@"image":@"JongHMoon.png",@"title":@"Prof. Jong Hu Moon",@"subtitle":@"South Korea"}, @{@"image":@"",@"title":@"Prof. Rungsun Rerknimitr",@"subtitle":@"Thailand"}, @{@"image":@"PSiersema.png",@"title":@"Prof. Peter Siersema",@"subtitle":@"Netherlands"}, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [faculty count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"facultyCell";
    ECFacultyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *facultyData = faculty[indexPath.row];
    cell.facultyImageView.image = [UIImage imageNamed:@"profile_placeholder.png"];
    if ([facultyData[@"image"] length] > 0) {
        cell.facultyImageView.image = [UIImage imageNamed:facultyData[@"image"]];
    }
    
    /*
    cell.facultyImageView.layer.cornerRadius = 5;
    cell.facultyImageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    cell.facultyImageView.layer.shadowOffset = CGSizeMake(0, 1);
    cell.facultyImageView.layer.shadowOpacity = 1;
    cell.facultyImageView.layer.shadowRadius = 5;
    cell.facultyImageView.clipsToBounds = NO;
     */
    
    cell.facultyTitleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    cell.facultyTitleLabel.text = facultyData[@"title"];
    cell.facultyTitleLabel.preferredMaxLayoutWidth = cell.facultyTitleLabel.frame.size.width;
    [cell.facultyTitleLabel sizeToFit];

    cell.facultySubtitleLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    cell.facultySubtitleLabel.text = facultyData[@"subtitle"];
    cell.facultySubtitleLabel.preferredMaxLayoutWidth = cell.facultySubtitleLabel.frame.size.width;
    [cell.facultySubtitleLabel sizeToFit];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
