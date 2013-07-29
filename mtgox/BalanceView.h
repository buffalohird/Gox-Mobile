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
#import "MtGox.h"
#import "NSString+StripedFloat.h"

@interface BalanceView : UIView

@property (nonatomic, strong) BalanceViewItem *currentPriceItem;
@property (nonatomic, strong) BalanceViewItem *currentBitcoinItem;
@property (nonatomic, strong) BalanceViewItem *currentDollarsItem;
@property (nonatomic, strong) MtGox *mtGox;


- (BalanceView *)setUp:(MtGox *)mtGox;
- (void)createBorder;
- (BalanceViewItem *)addBalanceItem:(int)index withPosY:(float)posY;
- (void)refreshData;

@end
