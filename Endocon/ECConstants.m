//
//  ECConstants.m
//  Endocon
//
//  Created by Mahavir Jain on 05/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECConstants.h"
#import "ECAppDelegate.h"
#import "UIColor+FlatUI.h"

@implementation ECConstants

+ (float)textSize
{
    return 14;
}

+ (float)titleSize
{
    return 18;
}

+ (float)buttonTextSize
{
    return 20;
}

+ (float)smallTextSize
{
    return 10;
}

+ (NSString *)baseURL
{
    return @"endocon2014.com";
}

+ (UIColor *)webBlueColor
{
    return [UIColor colorFromHexCode:@"#368CCC"];
}

+ (UIColor *)webRedColor
{
    return [UIColor colorFromHexCode:@"#FE0000"];
}


+ (ECWebService *)sharedEngine
{
    ECAppDelegate *appDelegate = (ECAppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.webService;
}

@end
