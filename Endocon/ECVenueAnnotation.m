//
//  ECVenueAnnotation.m
//  Endocon
//
//  Created by Mahavir Jain on 07/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECVenueAnnotation.h"

@implementation ECVenueAnnotation

- (id)initWithTitle:(NSString *)title andSubtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D) coordinate
{
    self = [super init];
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
        self.coordinate = coordinate;
    }
    
    return self;
}


@end
