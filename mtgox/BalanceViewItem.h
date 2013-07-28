//
//  BalanceViewItem.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define BALANCEX 190
#define BALANCEY 49
#define BALANCEWIDTH 125
#define BALANCEHEIGHT 165

@interface BalanceViewItem : UIView

@property UILabel *balanceItemLabel;
@property UILabel *balanceValueLabel;

- (void)createSubviews:(NSString *)balanceItemText;

@end
