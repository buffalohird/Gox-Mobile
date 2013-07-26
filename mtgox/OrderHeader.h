//
//  OrderHeader.h
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderHeader : UIView

@property (nonatomic, strong) UILabel *titleLabel;

- (OrderHeader *)createOrderHeader:(NSString *)name;
- (UIView *)createOrderCategory:(CGRect)rect andIndex:(int)index;
@end
