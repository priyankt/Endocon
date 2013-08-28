//
//  ECMainViewController.m
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECMainViewController.h"
#import "ECMainViewCell.h"
#import "NSString+FontAwesome.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UIBarButtonItem+FlatUI.h"
#import "ECConstants.h"
#import "ECMainHeaderView.h"
#import "SVProgressHUD.h"

@interface ECMainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong) NSArray *menuItems;
@property (strong, nonatomic) NSString *winnerText;
@property (weak, nonatomic) IBOutlet UILabel *winnerTextLabel;

@end

@implementation ECMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // get winner for this week
    [self getWinner];
    
    // Configure UI
    [self configureUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)getWinner
{
    MKNetworkOperation *getWinnerOperation = [ [ECConstants sharedEngine] getWinnerWithCompletionHandler:^(NSString *winnerText) {
        [SVProgressHUD dismiss];
        if (winnerText && winnerText.length > 0) {
            NSLog(@"%@", winnerText);
            [self updateWinnerText:winnerText];
        }
    } errorHandler:^(NSError *error){
        [SVProgressHUD dismiss];
        NSLog(@"%@", error);
    }];
    
    [SVProgressHUD showWithStatus:@"Loading.." maskType:SVProgressHUDMaskTypeGradient];
    [[ECConstants sharedEngine] enqueueOperation:getWinnerOperation];
}

- (void)updateWinnerText:(NSString *)winnerText
{
    NSLog(@"Winner = %@", winnerText);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.winnerTextLabel.text = winnerText;
    });
}

- (void)configureUI
{
    //self.title = @"Endocon 2014";
    self.navigationController.navigationBarHidden = YES;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"splash-background.png"]];
    
    self.winnerTextLabel.font = [UIFont boldFlatFontOfSize:[ECConstants textSize]];
    self.winnerTextLabel.textColor = [ECConstants webRedColor];

    //self.view.backgroundColor = [UIColor colorFromHexCode:@"#c2eafb"];
    //self.collectionView.backgroundColor = [UIColor whiteColor];
    self.menuItems = [ NSArray arrayWithObjects:
                        @{@"image":@"question.png",@"title":@"Quiz",@"segue":@"showQuiz"},@{@"image":@"document.png",@"title":@"Abstract",@"segue":@"showAbstract"},@{@"image":@"calendar.png",@"title":@"Schedule",@"segue":@"showSchedule"},@{@"image":@"settings-3.png",@"title":@"Training",@"segue":@"showWorkshop"},@{@"image":@"star.png",@"title":@"Gurukul",@"segue":@"showGurukul"},@{@"image":@"microphone.png",@"title":@"Faculty",@"segue":@"showFaculty"},@{@"image":@"users.png",@"title":@"Committe",@"segue":@"showCommitte"},@{@"image":@"info.png",@"title":@"About",@"segue":@"showAbout"},@{@"image":@"compose-4.png",@"title":@"Suggestions",@"segue":@"showSuggestion"}, @{@"image":@"pin.png",@"title":@"Venue",@"segue":@"showVenue"}, @{@"image":@"envelope.png",@"title":@"Contact",@"segue":@"showContact"}, @{@"image":@"newspaper.png",@"title":@"News",@"segue":@"showNews"}, nil
                      ];
    
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeFont: [UIFont boldFlatFontOfSize:[ECConstants titleSize]]};
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[ECConstants webRedColor]];
    [UIBarButtonItem configureFlatButtonsWithColor:[ECConstants webBlueColor]
                                  highlightedColor:[ECConstants webBlueColor]
                                      cornerRadius:3];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.menuItems count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ECMainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.menuLabel = self.menuItems[indexPath.item][@"title"];
    cell.menuImage = [UIImage imageNamed:self.menuItems[indexPath.item][@"image"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:self.menuItems[indexPath.item][@"segue"] sender:self];
}

/*
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ECMainHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader" forIndexPath:indexPath];
    
    if (self.winnerText) {
        headerView.winnerLabel.font = [UIFont boldFlatFontOfSize:[ECConstants titleSize]];
        headerView.winnerLabel.text = self.winnerText;
        headerView.winnerLabel.textColor = [ECConstants webBlueColor];
    }
    else {
        headerView.winnerLabel.hidden = YES;
    }
    
    return headerView;
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
