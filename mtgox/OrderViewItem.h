//
//  OrderViewItem.h
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface OrderViewItem : UIView

- (OrderViewItem *)createOrderView:(CGRect)frame;
@end
