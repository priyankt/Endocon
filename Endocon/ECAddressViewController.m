//
//  ECAddressViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECAddressViewController.h"
#import <MapKit/MapKit.h>
#import "ECVenueAnnotation.h"

#define METERS_PER_MILE 1609.344

@interface ECAddressViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ECAddressViewController

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
    self.title = @"J W MARRIOTT";
    self.mapView.delegate = self;
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    CLLocationCoordinate2D venueCoordinate;
    venueCoordinate.latitude = self.venueLat;
    venueCoordinate.longitude= self.venueLng;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(venueCoordinate, 1.5*METERS_PER_MILE, 1.5*METERS_PER_MILE);
    
    ECVenueAnnotation *venueAnnotation = [[ECVenueAnnotation alloc] initWithTitle:self.venueTitle andSubtitle:self.venueSubtitle andCoordinate:venueCoordinate];
    [self.mapView addAnnotation:venueAnnotation];
    
    [self.mapView setRegion:viewRegion animated:NO];
    [self.mapView selectAnnotation:venueAnnotation animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
