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
@synthesize mtGox = _mtGox;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (BalanceView *)setUp:(MtGox *)mtGox
{
    
    self.mtGox = mtGox;
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
            [self.currentPriceItem createSubviews:balanceItemText];
            break;
        case 1:
            balanceItemText = @"BTC Balance:";
            self.currentBitcoinItem = [[BalanceViewItem alloc] init];
            self.currentBitcoinItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
            [self.currentBitcoinItem createSubviews:balanceItemText];
            break;
        case 2:
            balanceItemText = @"USD Balance:";
            self.currentDollarsItem = [[BalanceViewItem alloc] init];
            self.currentDollarsItem.frame = CGRectMake(5.0, posY, BALANCEWIDTH - 10.0, 40.0);
            [self.currentDollarsItem createSubviews:balanceItemText];
            break;
        default:
            NSLog(@"invalid index for balanceItemText");
            break;
    }
                        
    switch(index){
        case 0:
            [self addSubview:self.currentPriceItem];
            return self.currentPriceItem;
            break;
        case 1:
            [self addSubview:self.currentBitcoinItem];
            return self.currentBitcoinItem;
            break;
        case 2:
            [self addSubview:self.currentDollarsItem];
            return self.currentDollarsItem;
            break;
        default:
            NSLog(@"invalid index for balanceItemText");
            return nil;
            break;
    }
}

- (void)refreshData
{
    self.currentPriceItem.balanceValueLabel.text = [NSString stringWithFormat:@"  %f", self.mtGox.lastPrice];
    
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
