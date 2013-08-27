//
//  ECAppDelegate.h
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECWebService.h"

@interface ECAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ECWebService *webService;

@end
