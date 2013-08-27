//
//  ECAddressViewController.h
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ECAddressViewController : UIViewController<MKMapViewDelegate>

@property (assign, nonatomic) double venueLat;
@property (assign, nonatomic) double venueLng;
@property (strong, nonatomic) NSString *venueTitle;
@property (strong, nonatomic) NSString *venueSubtitle;

@end
