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

@interface ECMainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *trophyLabel;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong) NSArray *menuItems;

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
	// Do any additional setup after loading the view.
    //ECMainView *mainView = [[ECMainView alloc] initWithFrame:self.view.frame];
    //self.view = mainView;
    
    self.title = @"Home";
    
    self.trophyLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    self.trophyLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconTrophy];
    self.trophyLabel.textColor = [UIColor pomegranateColor];
    
    self.winnerLabel.font = [UIFont boldFlatFontOfSize:12];
    self.winnerLabel.text = @"Last Week Quiz Winner: Dr. Mahavir Jain";
    self.winnerLabel.textColor = [UIColor pomegranateColor];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.menuItems = [NSArray arrayWithObjects:@"Weekly Quiz", @"Program Schedule", @"Program Workshop", @"Faculty", @"About Endocon", @"Suggestions", nil];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"i count");
    return [self.menuItems count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ECMainViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.menuLabel = self.menuItems[indexPath.item];
    cell.menuImage = [UIImage imageNamed:@"settings-icon.png"];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0:
            [self performSegueWithIdentifier:@"showQuiz" sender:self];
            break;
        case 1:
            [self performSegueWithIdentifier:@"showSchedule" sender:self];
            break;
        case 2:
            [self performSegueWithIdentifier:@"showWorkshop" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"showFaculty" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"showAbout" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"showSuggestion" sender:self];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
