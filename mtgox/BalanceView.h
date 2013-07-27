//
//  BalanceView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "BalanceViewItem.h"

@interface BalanceView : UIView

@property (nonatomic, strong) BalanceViewItem *currentPriceItem;
@property (nonatomic, strong) BalanceViewItem *currentBitcoinItem;
@property (nonatomic, strong) BalanceViewItem *currentDollarsItem;


- (BalanceView *)setUp;
- (void)createBorder;
- (BalanceViewItem *)addBalanceItem:(int)index withPosY:(float)posY;

@end
