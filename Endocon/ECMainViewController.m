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
//#import "ECMainHeaderView.h"
#import "SVProgressHUD.h"
#import <QuartzCore/QuartzCore.h>

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
        else {
            [self removeWinnerText];
        }
    } errorHandler:^(NSError *error){
        [SVProgressHUD dismiss];
        [self removeWinnerText];
        NSLog(@"%@", error);
    }];
    
    [SVProgressHUD showWithStatus:@"Loading Winner.." maskType:SVProgressHUDMaskTypeGradient];
    [[ECConstants sharedEngine] enqueueOperation:getWinnerOperation];
}

- (void)removeWinnerText
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.winnerTextLabel removeFromSuperview];
    });
}

- (void)updateWinnerText:(NSString *)winnerText
{
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

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:[ECConstants backgroundImageName]]];
    
    self.winnerTextLabel.font = [UIFont boldFlatFontOfSize:[ECConstants textSize]];
    self.winnerTextLabel.textColor = [ECConstants webRedColor];
    self.winnerTextLabel.backgroundColor = [UIColor whiteColor];
    self.winnerTextLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.winnerTextLabel.layer.shadowOffset = CGSizeMake(0, 1);
    self.winnerTextLabel.layer.shadowOpacity = 0.7;
    self.winnerTextLabel.layer.shadowRadius = 3;
    self.winnerTextLabel.clipsToBounds = NO;

    //self.view.backgroundColor = [UIColor colorFromHexCode:@"#c2eafb"];
    //self.collectionView.backgroundColor = [UIColor whiteColor];
    self.menuItems = [ NSArray arrayWithObjects:
                        @{@"image":@"quiz.png",@"highlighted":@"quiz_active.png",@"title":@"Quiz",@"segue":@"showQuiz"},@{@"image":@"abstract.png",@"highlighted":@"abstract_active.png",@"title":@"Abstract",@"segue":@"showAbstract"},@{@"image":@"highlights.png",@"highlighted":@"highlights_active.png",@"title":@"Highlights",@"segue":@"showSchedule"},@{@"image":@"training.png",@"highlighted":@"training_active.png",@"title":@"Training",@"segue":@"showWorkshop"},@{@"image":@"gurukul.png",@"highlighted":@"gurukul_active.png",@"title":@"Gurukul",@"segue":@"showGurukul"},@{@"image":@"faculty.png",@"highlighted":@"faculty_active.png",@"title":@"Faculty",@"segue":@"showFaculty"},@{@"image":@"committee.png",@"highlighted":@"committee_active.png",@"title":@"Committe",@"segue":@"showCommitte"},@{@"image":@"about.png",@"highlighted":@"about_active.png",@"title":@"About",@"segue":@"showAbout"},@{@"image":@"suggestions.png",@"highlighted":@"suggestions_active.png",@"title":@"Suggest",@"segue":@"showSuggestion"}, @{@"image":@"venue.png",@"highlighted":@"venue_active.png",@"title":@"Venue",@"segue":@"showVenue"}, @{@"image":@"contact.png",@"highlighted":@"contact_active.png",@"title":@"Contact",@"segue":@"showContact"}, @{@"image":@"news.png",@"highlighted":@"news_active.png",@"title":@"News",@"segue":@"showNews"}, nil
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
    
    cell.labelView.font = [UIFont boldFlatFontOfSize:[ECConstants textSize]];
    cell.labelView.textColor = [UIColor whiteColor];
    cell.labelView.text = self.menuItems[indexPath.item][@"title"];
    
    cell.imageView.image = [UIImage imageNamed:self.menuItems[indexPath.item][@"image"]];
    cell.imageView.highlightedImage = [UIImage imageNamed:self.menuItems[indexPath.item][@"highlighted"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ECMainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.highlighted = YES;
    
    [self performSegueWithIdentifier:self.menuItems[indexPath.item][@"segue"] sender:self];
}

/*
-(void) collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    ECMainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorFromHexCode:@"#30000000"];

}
 */

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
