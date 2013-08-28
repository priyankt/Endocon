//
//  ECQuizTableViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 06/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECQuizTableViewController.h"
#import "ECConstants.h"
#import "FUIButton.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "SVProgressHUD.h"

@interface ECQuizTableViewController ()

@property (weak, nonatomic) IBOutlet FUIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIImageView *quizImageView;
@property (weak, nonatomic) IBOutlet UILabel *quizLabel;

@end

@implementation ECQuizTableViewController {
    NSArray *options;
    NSString *question;
    NSString *imagePath;
    UITableViewCell *selectedCell;
    FUIAlertView *alertView;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

/*
- (id)initWithCoder:(NSCoder*)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        NSLog(@"init coder");
        [self getQuiz];
    }
    
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Inside view load");
    // Hide submit button
    self.submitButton.hidden = YES;
    // Set title
    self.title = @"Weekly Quiz";
    // set background image
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"splash-background.png"]]];
    [self configureAlertView];
    // Get quiz
    [self getQuiz];
}

- (void) configureAlertView
{
    alertView = [[FUIAlertView alloc] initWithTitle:@"Error" message:@"Unexpected error. Please try again." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
    
    alertView.titleLabel.textColor = [UIColor cloudsColor];
    alertView.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
    alertView.messageLabel.textColor = [UIColor cloudsColor];
    alertView.messageLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
    alertView.alertContainer.backgroundColor = [UIColor pomegranateColor];
    alertView.defaultButtonColor = [UIColor cloudsColor];
    alertView.defaultButtonShadowColor = [UIColor asbestosColor];
    alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    alertView.defaultButtonTitleColor = [UIColor asbestosColor];
}

- (void)getQuiz
{
    MKNetworkOperation *getWeeklyQuizOperation = [ [ECConstants sharedEngine] getWeeklyQuizWithCompletionHandler:^(NSDictionary *quizResponse) {
        if ([quizResponse objectForKey:@"question"] && [quizResponse objectForKey:@"options"] && quizResponse[@"question"] && quizResponse[@"options"]) {
            
            question = quizResponse[@"question"];
            options = quizResponse[@"options"];
            imagePath = quizResponse[@"image"];
            
            [[NSUserDefaults standardUserDefaults] setObject:quizResponse[@"qid"] forKey:@"qid"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            self.submitButton.hidden = NO;
            [self.tableView reloadData];
            // Set display
            [self configureUI];
        }
        else {
            [self displayAlertWithMessage:@"Error obtaining Quiz. Please try again." succes:0];
        }
        [SVProgressHUD dismiss];
        
    } errorHandler:^(NSError *error){
        [SVProgressHUD dismiss];
        [self displayAlertWithMessage:error.localizedDescription succes:0];
        NSLog(@"%@", error);
    }];
    
    [[ECConstants sharedEngine] enqueueOperation:getWeeklyQuizOperation];
    [SVProgressHUD showWithStatus:@"Loading.." maskType:SVProgressHUDMaskTypeGradient];
}

- (void)configureUI
{
    self.quizLabel.font= [UIFont flatFontOfSize:[ECConstants titleSize]];
    self.quizLabel.text = question;
    self.quizLabel.preferredMaxLayoutWidth = self.quizLabel.frame.size.width;
    [self.quizLabel sizeToFit];
    
    CGFloat headerHeight = 0;
    headerHeight += self.quizLabel.frame.origin.y + self.quizLabel.frame.size.height;
    
    NSLog(@"%@", imagePath);
    if (imagePath && imagePath.length > 0) {
        NSString *baseUrl = [ECConstants baseURL];
        self.quizImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[baseUrl stringByAppendingString:imagePath]]]];
        self.quizImageView.contentMode = UIViewContentModeScaleAspectFit;
        headerHeight += self.quizImageView.frame.size.height;
    }
    else {
        [self.quizImageView removeFromSuperview];
    }
    
    UIView *headerView = [self.quizLabel superview];
    headerView.frame = CGRectMake(headerView.frame.origin.x, headerView.frame.origin.y, headerView.frame.size.width, headerHeight + 20);
    
    //[[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setFont:[UIFont boldFlatFontOfSize:[ECConstants titleSize]]];
    //[[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setColor:[UIColor blackColor]];
    
    self.submitButton.buttonColor = [ECConstants webBlueColor];
    self.submitButton.cornerRadius = 6.0f;
    self.submitButton.shadowHeight = 3.0f;
    self.submitButton.cornerRadius = 6.0f;
    [self.submitButton setTitle:@"Submit Answer" forState:UIControlStateNormal];
    self.submitButton.titleLabel.font = [UIFont boldFlatFontOfSize:[ECConstants buttonTextSize]];
    [self.submitButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.submitButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)orientation duration:(NSTimeInterval)duration
{
    [self.tableView reloadData];
}
 */

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"%d", [options count]);
    return [options count];
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Select one of the following";
}
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont flatFontOfSize:[ECConstants textSize]];
    cell.textLabel.text = options[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedCell = [tableView cellForRowAtIndexPath:indexPath];
}

- (IBAction)submitAnswer:(id)sender
{
    if (selectedCell) {
        
        NSNumber *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"];
        NSNumber *qid = [[NSUserDefaults standardUserDefaults] objectForKey:@"qid"];
        NSString *userEmail = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_email"];
        NSString *answer = selectedCell.textLabel.text;
        
        if (userId) {
            MKNetworkOperation *answerOperation = [ [ECConstants sharedEngine] sendAnswerForQuestion:qid answer:answer userId:userId userEmail:userEmail completionHandler:^(NSDictionary *res) {
                [SVProgressHUD dismiss];
                if ( [res objectForKey:@"success"] && [res[@"success"] intValue] == 1) {
                    NSLog(@"Success");
                    // Submit the answer and show alert that answer has been submitted
                    [self displayAlertWithMessage:@"Your answer has been submitted." succes:YES];
                }
                else if ([res objectForKey:@"msg"] && res[@"msg"]) {
                    [self displayAlertWithMessage:res[@"msg"] succes:NO];
                }
                else {
                    [self displayAlertWithMessage:@"Error occured while submitting your answer. Please try again." succes:NO];
                }
                [alertView show];
            } errorHandler:^(NSError *error){
                [SVProgressHUD dismiss];
                [self displayAlertWithMessage:error.localizedDescription succes:NO];
                NSLog(@"%@", error);
            }];
            
            [SVProgressHUD showWithStatus:@"Sending Answer.." maskType:SVProgressHUDMaskTypeGradient];
            [[ECConstants sharedEngine] enqueueOperation:answerOperation];
        }
        else {
            // If not logged in then show login screen
            [self performSegueWithIdentifier:@"showLogin" sender:self];
        }
    } else {
        [self displayAlertWithMessage:@"Please select an answer" succes:NO];
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
    [alertView show];
}

@end
