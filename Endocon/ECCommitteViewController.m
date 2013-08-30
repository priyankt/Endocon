//
//  ECCommitteViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 25/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECCommitteViewController.h"
#import "ECCommitteCell.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import <QuartzCore/QuartzCore.h>

@interface ECCommitteViewController ()

@end

@implementation ECCommitteViewController {
    NSArray *committe;
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
    
    self.title = @"Committe";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ECConstants lightBackgroundImageName]]]];
    
    NSArray *patrons = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"M Y Bapaye",@"subtitle":@""}, @{@"image":@"",@"title":@"U P Diwate",@"subtitle":@""}, @{@"image":@"",@"title":@"D S Kelkar",@"subtitle":@""}, @{@"image":@"",@"title":@"V G Pai",@"subtitle":@""}, nil];
    NSArray *chairman = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Rajesh Dharamsi",@"subtitle":@""}, @{@"image":@"",@"title":@"A L Kakrani",@"subtitle":@""}, @{@"image":@"",@"title":@"Parimal Lawate",@"subtitle":@""}, @{@"image":@"",@"title":@"Vinay Thorat",@"subtitle":@""}, nil];
    NSArray *director = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Amol Bapaye",@"subtitle":@""}, nil];
    NSArray *cordinators = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Filipe Jose Alvarez",@"subtitle":@""}, @{@"image":@"",@"title":@"Mandar Doiphode",@"subtitle":@""}, @{@"image":@"",@"title":@"Harshal Gadhikar",@"subtitle":@""}, @{@"image":@"",@"title":@"Sujit Jahagirdar",@"subtitle":@""}, @{@"image":@"",@"title":@"Vivekanand Kulkarni",@"subtitle":@""}, @{@"image":@"",@"title":@"Nitin Pai",@"subtitle":@""}, @{@"image":@"",@"title":@"Uday Patil",@"subtitle":@""}, @{@"image":@"",@"title":@"Rajendra Pujari",@"subtitle":@""}, @{@"image":@"",@"title":@"Lalit Shimpi",@"subtitle":@""},nil];
    NSArray *treasurer = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Sheetal Dhadphale Mahajani",@"subtitle":@""}, nil];
     NSArray *scientificCommitteMembers = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"S S Ambikar ",@"subtitle":@""}, @{@"image":@"",@"title":@"Aneesh Amte",@"subtitle":@""}, @{@"image":@"",@"title":@"Advay Aher",@"subtitle":@""}, @{@"image":@"",@"title":@"S S Bhalerao",@"subtitle":@""}, @{@"image":@"",@"title":@"Vishnu Biradar",@"subtitle":@""}, @{@"image":@"",@"title":@"Mukesh Chawla",@"subtitle":@""}, @{@"image":@"",@"title":@"Suhas Date",@"subtitle":@""}, @{@"image":@"",@"title":@"Nachiket Dubale",@"subtitle":@""}, @{@"image":@"",@"title":@"Santosh Hazare",@"subtitle":@""}, @{@"image":@"",@"title":@"Manoj Jain",@"subtitle":@""}, @{@"image":@"",@"title":@"Suresh Jain",@"subtitle":@""}, @{@"image":@"",@"title":@"M M Joshi",@"subtitle":@""}, @{@"image":@"",@"title":@"Kayamkhani",@"subtitle":@""}, @{@"image":@"",@"title":@"Arun Mangoli",@"subtitle":@""}, @{@"image":@"",@"title":@"Snehal Malgave",@"subtitle":@""}, @{@"image":@"",@"title":@"Deepak Patil",@"subtitle":@""}, @{@"image":@"",@"title":@"Mrinmayee Panda",@"subtitle":@""}, @{@"image":@"",@"title":@"Shashikant Pawar",@"subtitle":@""}, @{@"image":@"",@"title":@"Amul Pawaskar",@"subtitle":@""}, @{@"image":@"",@"title":@"Sanjay Salunkhe",@"subtitle":@""}, @{@"image":@"",@"title":@"Pravin Salunkhe",@"subtitle":@""}, @{@"image":@"",@"title":@"Sandeep Shrotri",@"subtitle":@""}, @{@"image":@"",@"title":@"Mahesh Thombre",@"subtitle":@""}, @{@"image":@"",@"title":@"Suhas Wagle",@"subtitle":@""}, @{@"image":@"",@"title":@"Gajanan Wagholikar ",@"subtitle":@""}, nil];
    NSArray *regionalCordinators = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Prashant Bhandarkar",@"subtitle":@""}, @{@"image":@"",@"title":@"Hussain Bohari",@"subtitle":@""}, @{@"image":@"",@"title":@"Nitin Borse",@"subtitle":@""}, @{@"image":@"",@"title":@"Aniruddha Gopanpallikar",@"subtitle":@""}, @{@"image":@"",@"title":@"Sandeep Kalokhe",@"subtitle":@""}, @{@"image":@"",@"title":@"Abhiram Paranjape",@"subtitle":@""}, @{@"image":@"",@"title":@"Ramesh Satarkar",@"subtitle":@""}, nil];
    
    committe = [[NSArray alloc] initWithObjects:@{@"section":@"Patrons", @"members":patrons}, @{@"section":@"Course Chairman", @"members":chairman}, @{@"section":@"Course Director", @"members":director}, @{@"section":@"Course Coordinators", @"members":cordinators}, @{@"section":@"Treasurer", @"members":treasurer}, @{@"section":@"Scientific Committee Members", @"members":scientificCommitteMembers}, @{@"section":@"Regional Coordinators", @"members":regionalCordinators}, nil];
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
    return [committe count];
}

/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    sectionLabel.text = committe[section][@"section"];
    sectionLabel.font = [UIFont flatFontOfSize:[ECConstants titleSize]];
    sectionLabel.textColor = [ECConstants webRedColor];
    sectionLabel.backgroundColor = [UIColor clearColor];
    
    return sectionLabel;
}
 */

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return committe[section][@"section"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [ committe[section][@"members"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"committeCell";
    ECCommitteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    NSDictionary *committeData = committe[indexPath.section][@"members"][indexPath.row];
    if ([committeData[@"image"] length] > 0) {
        cell.imageView.image = [UIImage imageNamed:committeData[@"image"]];
    }
    
    cell.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    cell.titleLabel.text = committeData[@"title"];
    
    return cell;
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
