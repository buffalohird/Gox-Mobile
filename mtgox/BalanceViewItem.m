//
//  BalanceViewItem.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "BalanceViewItem.h"

@implementation BalanceViewItem

@synthesize balanceItemLabel = _balanceItemLabel;
@synthesize balanceValueLabel = _balanceValueLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)createSubviews:(NSString *)balanceItemText
{
    self.balanceItemLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, -5, BALANCEWIDTH - 20, 20.0)];
    self.balanceItemLabel.text = balanceItemText;
    self.balanceItemLabel.font = [UIFont boldSystemFontOfSize:12];
    self.balanceItemLabel.textColor = [UIColor whiteColor];
    self.balanceItemLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:self.balanceItemLabel];

    self.balanceValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, BALANCEWIDTH - 20, 30.0)];
    self.balanceValueLabel.text = @"  $40.0355555";
    self.balanceValueLabel.font = [UIFont boldSystemFontOfSize:12];
    self.balanceValueLabel.textColor = [UIColor whiteColor];
    self.balanceValueLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:self.balanceValueLabel];
    
    self.balanceValueLabel.layer.cornerRadius = 4.0f;
    self.balanceValueLabel.layer.masksToBounds = YES;
    self.balanceValueLabel.layer.borderWidth = 2.0f;
    self.balanceValueLabel.layer.borderColor = [[UIColor darkGrayColor] CGColor];
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
