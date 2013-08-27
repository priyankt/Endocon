//
//  ECSuggestionViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECSuggestionViewController.h"
#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"
#import "ECConstants.h"
#import "SVProgressHUD.h"
#import "FUIAlertView.h"

@interface ECSuggestionViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextView *suggestionTextField;
@property (weak, nonatomic) IBOutlet FUIButton *sendButton;

- (void)configureUI;

@end

@implementation ECSuggestionViewController {
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
- (IBAction)submitSuggestion:(id)sender
{
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *contact = self.phoneTextField.text;
    NSString *city = self.cityTextField.text;
    NSString *message = self.suggestionTextField.text;
    
    if (name.length > 0 && email.length > 0 && contact.length > 0 && city.length > 0 && message.length > 0) {
        MKNetworkOperation *sendSuggestionOperation = [ [ECConstants sharedEngine] sendSuggestionFrom:name email:email phone:contact city:city text:message completionHandler:^(id suggestionResponse) {
            if ([suggestionResponse[@"success"] intValue] == 1) {
                [SVProgressHUD dismiss];
                [self displayAlertWithMessage:@"Thank You.\nYour suggestion has been forwarded to Endocon team." succes:YES];
            }
            else {
                [self displayAlertWithMessage:@"Failed submitting your suggestion. Please try again." succes:NO];
            }
        } errorHandler:^(NSError *error){
            [SVProgressHUD dismiss];
            NSLog(@"%@", error);
            [self displayAlertWithMessage:error.localizedDescription succes:NO];
        }];
        
        [SVProgressHUD showWithStatus:@"Sending Suggestion.." maskType:SVProgressHUDMaskTypeGradient];
        [[ECConstants sharedEngine] enqueueOperation:sendSuggestionOperation];
    }
    else {
        [self displayAlertWithMessage:@"Please enter all the values." succes:NO];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureUI];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)configureUI {
    self.title = @"Suggestion";
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.sendButton.buttonColor = [ECConstants webBlueColor];
    self.sendButton.cornerRadius = 6.0f;
    self.sendButton.shadowHeight = 3.0f;
    self.sendButton.cornerRadius = 6.0f;
    self.sendButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    [self.sendButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.nameTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
    if (userName) {
        self.nameTextField.text = userName;
    }

    self.emailTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    NSString *userEmail = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_email"];
    if (userEmail) {
        self.emailTextField.text = userEmail;
    }
    
    self.phoneTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    NSString *userContact = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_contact"];
    if (userContact) {
        self.phoneTextField.text = userContact;
    }
    self.cityTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    NSString *userCity = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_city"];
    if (userCity) {
        self.cityTextField.text = userCity;
    }
    
    self.suggestionTextField.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    self.suggestionTextField.delegate = self;
    
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

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if (textView == self.suggestionTextField) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
