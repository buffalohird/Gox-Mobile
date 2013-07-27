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

- (TradeView *)createTradeView;
- (void) printQuote;

@end
