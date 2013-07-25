//
//  TradeView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "TradeView.h"

@implementation TradeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (TradeView *)createTradeView
{
    self.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    self.backgroundColor = [UIColor blackColor];
    
    //make the Most Recent Order Label
    UILabel *recentOrderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200.0, 40.0)];
    recentOrderLabel.text = @"Most Recent Order:";
    recentOrderLabel.font = [UIFont boldSystemFontOfSize:14];
    recentOrderLabel.textColor = [UIColor whiteColor];
    recentOrderLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:recentOrderLabel];

    //make the Balances Label
    UILabel *orderBalancesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200.0, 40.0)];
    orderBalancesLabel.text = @"Balances:";
    orderBalancesLabel.font = [UIFont boldSystemFontOfSize:14];
    orderBalancesLabel.textColor = [UIColor whiteColor];
    orderBalancesLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderBalancesLabel];

    //make the Size Label
    UILabel *orderSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 200.0, 40.0)];
    orderSizeLabel.text = @"Size:";
    orderSizeLabel.font = [UIFont boldSystemFontOfSize:14];
    orderSizeLabel.textColor = [UIColor whiteColor];
    orderSizeLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderSizeLabel];

    //make the Price Label
    UILabel *orderPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,235, 200.0, 40.0)];
    orderPriceLabel.text = @"Price:";
    orderPriceLabel.font = [UIFont boldSystemFontOfSize:14];
    orderPriceLabel.textColor = [UIColor whiteColor];
    orderPriceLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderPriceLabel];

    //make the Total Label
    UILabel *orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 290, 200.0, 40.0)];
    orderTotalLabel.text = @"Total:";
    orderTotalLabel.font = [UIFont boldSystemFontOfSize:14];
    orderTotalLabel.textColor = [UIColor whiteColor];
    orderTotalLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderTotalLabel];

    [self setHidden:YES];
    return self;
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
