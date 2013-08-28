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
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    
    committe = [[NSArray alloc] initWithObjects:@{@"image":@"",@"title":@"Dr. Pinghong Zhou",@"subtitle":@"China"}, @{@"image":@"",@"title":@"Dr. Shyam Varadarajulu",@"subtitle":@"USA"}, nil];
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
    return [committe count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"committeCell";
    ECCommitteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *committeData = committe[indexPath.row];
    if ([committeData[@"image"] length] > 0) {
        cell.imageView.image = [UIImage imageNamed:committeData[@"image"]];
    }
    
    /*
    cell.imageView.layer.cornerRadius = 5;
    cell.imageView.layer.shadowColor = [[UIColor blackColor] CGColor];
    cell.imageView.layer.shadowOffset = CGSizeMake(0, 1);
    cell.imageView.layer.shadowOpacity = 1;
    cell.imageView.layer.shadowRadius = 5;
    cell.imageView.clipsToBounds = NO;
    */
    cell.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    cell.titleLabel.text = committeData[@"title"];
    //[cell.titleLabel sizeToFit];
    
    cell.subtitleLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    cell.subtitleLabel.text = committeData[@"subtitle"];
    //[cell.subtitleLabel sizeToFit];
    
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
