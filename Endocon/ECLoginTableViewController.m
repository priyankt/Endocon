//
//  ECLoginTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 08/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECLoginTableViewController.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "ECConstants.h"
#import "SVProgressHUD.h"
#import "FUIAlertView.h"

@interface ECLoginTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (weak, nonatomic) IBOutlet FUIButton *loginButton;
@property (weak, nonatomic) IBOutlet FUIButton *cancelButton;
@property (weak, nonatomic) IBOutlet FUIButton *registerButton;

@end

@implementation ECLoginTableViewController {
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)configureUI
{
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    
    self.emailLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    
    self.loginButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    self.loginButton.buttonColor = [ECConstants webRedColor];
    self.loginButton.shadowColor = [UIColor greenSeaColor];
    self.loginButton.shadowHeight = 3.0f;
    self.loginButton.cornerRadius = 6.0f;
    [self.loginButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.cancelButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    self.cancelButton.buttonColor = [UIColor lightGrayColor];
    self.cancelButton.shadowColor = [UIColor greenSeaColor];
    self.cancelButton.shadowHeight = 3.0f;
    self.cancelButton.cornerRadius = 6.0f;
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.registerButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    self.registerButton.buttonColor = [ECConstants webBlueColor];
    self.registerButton.shadowColor = [UIColor lightGrayColor];
    self.registerButton.shadowHeight = 3.0f;
    self.registerButton.cornerRadius = 6.0f;
    [self.registerButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)authenticateUser:(id)sender {
    // write authentication code here
    NSString *email = self.emailLabel.text;
    NSString *password = self.passwordLabel.text;
    
    if (email.length >0 && password.length > 0) {
        MKNetworkOperation *loginOperation = [ [ECConstants sharedEngine] loginWithUsername:email password:password completionHandler:^(NSNumber *userId) {
            
            if (userId) {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else {
                [self displayAlertWithMessage:@"Error while login. Please try again." succes:NO];
            }
            [SVProgressHUD dismiss];
            
        } errorHandler:^(NSError *error){
            [SVProgressHUD dismiss];
            [self displayAlertWithMessage:error.localizedDescription succes:NO];
            NSLog(@"%@", error);
        }];
        
        [SVProgressHUD showWithStatus:@"Checking.." maskType:SVProgressHUDMaskTypeGradient];
        [[ECConstants sharedEngine] enqueueOperation:loginOperation];
    }
    else {
        [self displayAlertWithMessage:@"Please provide all the values." succes:NO];
    }
}

- (IBAction)cancelLogin:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerNewUser:(id)sender {
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

@end
