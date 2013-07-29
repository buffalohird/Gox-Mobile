//
//  OrderView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderViewItem.h"
#import "Order.h"
#import "OrderHeader.h"
#import "MtGox.h"

@interface OrderView : UIScrollView

@property (nonatomic, strong) OrderHeader *header;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) MtGox *mtGox;
@property (nonatomic, strong)UIView *orderListView;


- (OrderView *)createOrderView:(CGRect)frame andName:(NSString *)name andGox:(MtGox *)mtGox;
- (void)setHeight:(float)height;
- (void)refreshData:(int)type;

@end
