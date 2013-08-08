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
@synthesize mtGox = _mtGox;
@synthesize orderListView = _orderListView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (OrderView *)createOrderView:(CGRect)frame andName:(NSString *)name andGox:(MtGox *)mtGox
{
    self.mtGox = mtGox;
    self.frame = frame;
    self.name = name;
    self.contentSize = CGSizeMake(320, 800);
    self.backgroundColor = [UIColor grayColor];
    self.showsVerticalScrollIndicator = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.scrollEnabled = YES;
    [self setUserInteractionEnabled:YES];
    
    self.header = [[OrderHeader alloc] init];
    [self.header createOrderHeader:self.name];
    [self addSubview:self.header];
    
    self.orderListView = [[UIView alloc] init];
    self.orderListView.frame = CGRectMake(0.0, 0.0, self.bounds.size.width, self.bounds.size.height);
    [self addSubview:self.orderListView];
    
    return self;
}

- (void)setHeight:(float)height
{
    self.contentSize = CGSizeMake(self.frame.size.width, height);
}

- (void)refreshData:(int)type
{
    [[self.orderListView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSArray *dataArray;
    if(type == 0)
        dataArray = [NSArray arrayWithArray:self.mtGox.bids];
    else if(type == 1)
         dataArray = [NSArray arrayWithArray:self.mtGox.asks];
    else
        NSLog(@"error picking data array for updating order view");
    
    float totalVolume = 0;
    int arrayLength = [dataArray count];
    
    self.contentSize = CGSizeMake(self.bounds.size.width, 40.0 * arrayLength);
    self.orderListView.frame = CGRectMake(0.0, 0.0, self.orderListView.frame.size.width, self.bounds.size.height);
    
    NSLog(@"%@", dataArray[0][@"stamp"]);
    for(int i = 0; i < arrayLength - 1; i++)
    {
        OrderViewItem *orderViewItem = [[OrderViewItem alloc] init];
        [orderViewItem createOrderView:CGRectMake(0.0, 40.0 * (i + 1), 320.0, 40.0)];
        
        totalVolume += [dataArray[i][@"amount"] floatValue];
        
        orderViewItem.priceLabel.text = [NSString stringWithFormat:@"%.5f", [dataArray[i][@"price"] floatValue]];
        orderViewItem.sizeLabel.text = [NSString stringWithFormat:@"%.5f", [dataArray[i][@"amount"] floatValue]];
        orderViewItem.totalLabel.text = [NSString stringWithFormat:@"%.5f", totalVolume];
        
        [self.orderListView addSubview:orderViewItem];
    }
    
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
