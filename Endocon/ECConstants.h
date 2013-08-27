//
//  ECConstants.h
//  Endocon
//
//  Created by Mahavir Jain on 05/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ECWebService.h"

@interface ECConstants : NSObject

+ (float)textSize;
+ (float)titleSize;
+ (float)buttonTextSize;
+ (float)smallTextSize;

+ (NSString *) baseURL;
+ (UIColor *)webBlueColor;
+ (UIColor *)webRedColor;

+ (ECWebService *) sharedEngine;

@end
