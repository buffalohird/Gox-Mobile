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

@synthesize currentPriceItem = _currentPriceItem;
@synthesize currentBitcoinItem = _currentBitcoinItem;
@synthesize currentDollarsItem = _currentDollarsItem;

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
    NSString *balanceItemText;
    switch(index){
        case 0:
            balanceItemText = @"Last Price:";
            self.currentPriceItem = [[BalanceViewItem alloc] init];
            self.currentPriceItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
            break;
        case 1:
            balanceItemText = @"BTC Balance:";
            self.currentBitcoinItem = [[BalanceViewItem alloc] init];
            self.currentBitcoinItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
            break;
        case 2:
            self.currentDollarsItem = [[BalanceViewItem alloc] init];
            self.currentDollarsItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
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
    
    UILabel *balanceValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 15, BALANCEWIDTH - 20, 30.0)];
    balanceValueLabel.text = @"  $40.0355555";
    balanceValueLabel.font = [UIFont boldSystemFontOfSize:12];
    balanceValueLabel.textColor = [UIColor whiteColor];
    balanceValueLabel.backgroundColor = [UIColor blackColor];
    
    balanceValueLabel.layer.cornerRadius = 4.0f;
    balanceValueLabel.layer.masksToBounds = YES;
    balanceValueLabel.layer.borderWidth = 2.0f;
    balanceValueLabel.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    
            
    switch(index){
        case 0:
            [self.currentPriceItem addSubview:balanceItemLabel];
            [self.currentPriceItem addSubview:balanceValueLabel];
            [self addSubview:self.currentPriceItem];
            return self.currentPriceItem;
            break;
        case 1:
            [self.currentBitcoinItem addSubview:balanceItemLabel];
            [self.currentBitcoinItem addSubview:balanceValueLabel];
            [self addSubview:self.currentBitcoinItem];
            return self.currentBitcoinItem;
            break;
        case 2:
            [self.currentDollarsItem addSubview:balanceItemLabel];
            [self.currentDollarsItem addSubview:balanceValueLabel];
            [self addSubview:self.currentDollarsItem];
            return self.currentDollarsItem;
            break;
        default:
            NSLog(@"invalid index for balanceItemText");
            return nil;
            break;
    }
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
