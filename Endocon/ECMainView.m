//
//  ECMainView.m
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECMainView.h"
#import "NSString+FontAwesome.h"
#import "UIFont+FlatUI.h"
#import "UIColor+FlatUI.h"

@implementation ECMainView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel *trophyLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 30, 20, 20)];
        trophyLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
        trophyLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconTrophy];
        trophyLabel.textColor = [UIColor pomegranateColor];
        [self addSubview:trophyLabel];
        
        UILabel *winnerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 60, 200, 10)];
        winnerLabel.font = [UIFont boldFlatFontOfSize:10];
        winnerLabel.text = @"Last Week Quiz Winner: Dr. Mahavir Jain";
        winnerLabel.textColor = [UIColor pomegranateColor];
        [self addSubview:winnerLabel];
        
        /*
        UILabel *aboutLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 50, 50)];
        aboutLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:50];
        aboutLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconInfoSign];
        aboutLabel.textColor = [UIColor grayColor];
        [self addSubview:aboutLabel];
        
        UILabel *scheduleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 80, 50, 50)];
        scheduleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:50];
        scheduleLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconCalendar];
        scheduleLabel.textColor = [UIColor grayColor];
        [self addSubview:scheduleLabel];
        
        UILabel *workshopLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 50)];
        workshopLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:50];
        workshopLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconWrench];
        workshopLabel.textColor = [UIColor grayColor];
        [self addSubview:workshopLabel];
        
        UILabel *facultyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 50, 50)];
        facultyLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:50];
        facultyLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconUserMd];
        facultyLabel.textColor = [UIColor grayColor];
        [self addSubview:facultyLabel];
         */
        
        self.backgroundColor = [UIColor whiteColor];

    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
