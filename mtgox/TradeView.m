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
