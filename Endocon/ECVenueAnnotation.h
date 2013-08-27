//
//  ECVenueAnnotation.h
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface ECVenueAnnotation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D) coordinate;

@end
