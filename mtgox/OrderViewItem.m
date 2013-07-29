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

@synthesize priceLabel = _priceLabel;
@synthesize sizeLabel = _sizeLabel;
@synthesize totalLabel = _totalLabel;

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
    
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.frame = CGRectMake(0.0, 0.0, self.bounds.size.width / 3, self.bounds.size.height);
    self.priceLabel.backgroundColor = [UIColor clearColor];
    self.priceLabel.text = @"";
    self.priceLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.priceLabel];
    
    self.sizeLabel = [[UILabel alloc] init];
    self.sizeLabel.frame = CGRectMake(self.bounds.size.width / 3, 0.0, self.bounds.size.width / 3, self.bounds.size.height);
    self.sizeLabel.backgroundColor = [UIColor clearColor];
    self.sizeLabel.text = @"";
    self.sizeLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.sizeLabel];
    
    self.totalLabel = [[UILabel alloc] init];
    self.totalLabel.frame = CGRectMake(2 * self.bounds.size.width / 3, 0.0, self.bounds.size.width / 3, self.bounds.size.height);
    self.totalLabel.backgroundColor = [UIColor clearColor];
    self.totalLabel.text = @"";
    self.totalLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.totalLabel];
    
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
