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

@interface ECSuggestionViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextView *suggestionTextField;
@property (weak, nonatomic) IBOutlet FUIButton *sendButton;

@end

@implementation ECSuggestionViewController

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
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Suggestion";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.sendButton.buttonColor = [UIColor pomegranateColor];
    self.sendButton.cornerRadius = 6.0f;
    self.sendButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.sendButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 3;
    if (section == 1) {
        rows = 1;
    }
    
    // Return the number of rows in the section.
    return rows;
}

@end
