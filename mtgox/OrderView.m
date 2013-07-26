//
//  OrderView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "OrderView.h"

@implementation OrderView

@synthesize header = _header;
@synthesize name = _name;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (OrderView *)createOrderView:(CGRect)frame andName:(NSString *)name
{
    self.frame = frame;
    self.name = name;
    self.contentSize = CGSizeMake(320, 800);
    self.backgroundColor = [UIColor grayColor];
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.scrollEnabled = YES;
    
    self.header = [[OrderHeader alloc] init];
    [self.header createOrderHeader:self.name];
    [self addSubview:self.header];
    
    return self;
}

- (void)setHeight:(float)height
{
    self.contentSize = CGSizeMake(self.frame.size.width, height);
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
