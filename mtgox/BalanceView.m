//
//  BalanceView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "BalanceView.h"

#define BALANCEX 190
#define BALANCEY 49
#define BALANCEWIDTH 125
#define BALANCEHEIGHT 165


@implementation BalanceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (BalanceView *)setUp
{
    self.frame = CGRectMake(BALANCEX, BALANCEY, BALANCEWIDTH, BALANCEHEIGHT);
    self.backgroundColor = [UIColor blackColor];
    [self createBorder];
    
    
    
    return self;
}

- (void)createBorder
{
     self.layer.cornerRadius = 8.0f;
     self.layer.masksToBounds = YES;
     self.layer.borderWidth = 2.0f;
     self.layer.borderColor = [[UIColor darkGrayColor] CGColor];
}

- (BalanceViewItem *)addBalanceItem:(int)index withPosY:(float) posY
{
    BalanceViewItem *newBalanceItem = [[BalanceViewItem alloc] init];
    newBalanceItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
            
    NSString *balanceItemText;
    switch(index){
        case 0:
            balanceItemText = @"Last Price:";
            break;
        case 1:
            balanceItemText = @"BTC Balance:";
            break;
        case 2:
            balanceItemText = @"USD Balance:";
            break;
        default:
            NSLog(@"invalid index for balanceItemText");
            break;
    }
    
    UILabel *balanceItemLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, -5, BALANCEWIDTH - 20, 20.0)];
    balanceItemLabel.text = balanceItemText;
    balanceItemLabel.font = [UIFont boldSystemFontOfSize:12];
    balanceItemLabel.textColor = [UIColor whiteColor];
    balanceItemLabel.backgroundColor = [UIColor clearColor];
    [newBalanceItem addSubview:balanceItemLabel];
    
    UILabel *balanceValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, BALANCEWIDTH - 20, 30.0)];
    balanceValueLabel.text = @"  $40.0355555";
    balanceValueLabel.font = [UIFont boldSystemFontOfSize:12];
    balanceValueLabel.textColor = [UIColor whiteColor];
    balanceValueLabel.backgroundColor = [UIColor blackColor];
    [newBalanceItem addSubview:balanceValueLabel];
    
    balanceValueLabel.layer.cornerRadius = 4.0f;
    balanceValueLabel.layer.masksToBounds = YES;
    balanceValueLabel.layer.borderWidth = 2.0f;
    balanceValueLabel.layer.borderColor = [[UIColor darkGrayColor] CGColor];
        
    [self addSubview:newBalanceItem];
    return newBalanceItem;
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
