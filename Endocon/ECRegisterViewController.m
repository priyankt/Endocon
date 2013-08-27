//
//  ECRegisterViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 24/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECRegisterViewController.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "FUIButton.h"
#import "FUIAlertView.h"
#import "SVProgressHUD.h"

@interface ECRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *contactTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;

@property (weak, nonatomic) IBOutlet FUIButton *registerButton;
@property (weak, nonatomic) IBOutlet FUIButton *cancelButton;

@end

@implementation ECRegisterViewController {
    FUIAlertView *alertView;
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
    [self configureUI];
}

- (void)configureUI
{
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    
    self.nameTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    self.emailTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    self.contactTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    self.cityTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    
    self.registerButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    self.registerButton.buttonColor = [ECConstants webRedColor];
    self.registerButton.cornerRadius = 6.0f;
    self.registerButton.shadowHeight = 3.0f;
    self.registerButton.cornerRadius = 6.0f;
    [self.registerButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.cancelButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    self.cancelButton.buttonColor = [UIColor lightGrayColor];
    self.cancelButton.cornerRadius = 6.0f;
    self.cancelButton.shadowHeight = 3.0f;
    self.cancelButton.cornerRadius = 6.0f;
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    alertView = [[FUIAlertView alloc] initWithTitle:@"Error" message:@"Unexpected error. Please try again." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [ECConstants webRedColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registerUser:(id)sender {
    
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *passwd = self.passwordTextField.text;
    NSString *contact = self.contactTextField.text;
    NSString *city = self.cityTextField.text;

    if (name.length > 0 && email.length > 0 && passwd.length > 0 && contact.length > 0 && city.length > 0) {
        MKNetworkOperation *signupOperation = [ [ECConstants sharedEngine] signupWithName:name email:email password:passwd phone:contact city:city completionHandler:^(NSDictionary *result) {
            [SVProgressHUD dismiss];
            if ([result objectForKey:@"id"]) {
                
                [[NSUserDefaults standardUserDefaults] setObject:result[@"id"] forKey:@"user_id"];
                [[NSUserDefaults standardUserDefaults] setObject:email forKey:@"user_email"];
                [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"user_name"];
                [[NSUserDefaults standardUserDefaults] setObject:contact forKey:@"user_contact"];
                [[NSUserDefaults standardUserDefaults] setObject:city forKey:@"user_city"];
                [[NSUserDefaults standardUserDefaults] synchronize];

                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                [self displayAlertWithMessage:result[@"msg"] succes:NO];
            }
        } errorHandler:^(NSError *error){
            [SVProgressHUD dismiss];
            NSLog(@"%@", error);
            [self displayAlertWithMessage:error.localizedDescription succes:NO];
        }];
        
        [SVProgressHUD showWithStatus:@"Registering.." maskType:SVProgressHUDMaskTypeGradient];
        [[ECConstants sharedEngine] enqueueOperation:signupOperation];
    }
    else {
        [self displayAlertWithMessage:@"Please enter values for all the fields." succes:NO];
    }
}

- (void)displayAlertWithMessage:(NSString *)message succes:(BOOL)success
{
    NSString *title = @"Error";
    UIColor *backgroundColor = [ECConstants webRedColor];
    if (success) {
        title = @"Success";
        backgroundColor = [UIColor greenSeaColor];
    }
    alertView.titleLabel.text = title;
    alertView.messageLabel.text = message;
    alertView.alertContainer.backgroundColor = [ECConstants webRedColor];
    [alertView show];
}

- (IBAction)cancelRegistration:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
