//
//  ECMainViewCell.m
//  Endocon
//
//  Created by Mahavir Jain on 02/08/13.
//  Copyright (c) 2013 Mobisys Technology. All rights reserved.
//

#import "ECMainViewCell.h"
#import "ECConstants.h"
#import "UIFont+FlatUI.h"
#import <QuartzCore/QuartzCore.h>

@interface ECMainViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *labelView;

@end

@implementation ECMainViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setMenuImage:(UIImage *)menuImage
{
    _menuImage = menuImage;
    self.imageView.image = menuImage;
}

- (void)setMenuLabel:(NSString *)menuLabel {
    _menuLabel = menuLabel;
    self.labelView.text = menuLabel;
    self.labelView.font = [UIFont boldFlatFontOfSize:12];
    self.labelView.textColor = [UIColor blackColor];
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
