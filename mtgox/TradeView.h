//
//  TradeView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MtGox.h"

@interface TradeView : UIView

@property (nonatomic, strong) MtGox *mtGox;

@property (nonatomic, strong) UITextField *orderSizeInput;
@property (nonatomic, strong) UITextField *orderPriceInput;
@property (nonatomic, strong) UITextField *orderTotalInput;


- (TradeView *)createTradeView:(MtGox *)mtGox;
- (void) printQuote;
- (void)refreshData;
- (void) calcOrder: (UIButton *) clickedSection;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void) cancelRecentOrder;

@end
