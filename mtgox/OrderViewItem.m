//
//  OrderView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "OrderViewItem.h"

#define ORDERHEIGHT 40

@implementation OrderViewItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (OrderViewItem *)createOrderView:(CGRect)frame
{
    self.frame = frame;
    self.backgroundColor = [UIColor whiteColor];
    
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
