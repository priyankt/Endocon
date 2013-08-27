//
//  ECViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECSplashViewController.h"
#import "ECConstants.h"

@interface ECSplashViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *visionImageView;

@property (weak, nonatomic) IBOutlet UIImageView *splashImageView;

@end

@implementation ECSplashViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(showMainScreen) userInfo:nil repeats:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGRect destLogoFrame = self.splashImageView.frame;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash-background-dark.png"]];
    self.splashImageView.frame = CGRectMake(destLogoFrame.origin.x+destLogoFrame.size.width, destLogoFrame.origin.y, destLogoFrame.size.width, destLogoFrame.size.height);
    
    [UIView animateWithDuration:1
                     animations:^{
                         self.splashImageView.frame = destLogoFrame;                   }
                     completion:^(BOOL finished) {
                         
                     }];
    
}

- (void)showMainScreen
{
    [self performSegueWithIdentifier:@"showNavController" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
