//
//  ECVenueViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 26/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECVenueViewController.h"
#import "ECAddressViewController.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"

@interface ECVenueViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation ECVenueViewController

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
    
    self.title = @"Venue";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    self.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    self.subtitleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants textSize]];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showMap"]) {
        ECAddressViewController *mapViewController = [segue destinationViewController];
        mapViewController.venueLat = 18.532138;
        mapViewController.venueLng = 73.829653;
        mapViewController.venueTitle = self.titleLabel.text;
        mapViewController.venueSubtitle = self.subtitleLabel.text;
    }
}

@end
