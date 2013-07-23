//
//  CalculatorButtonView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/22/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorButtonView : UIButton

@property (nonatomic, strong)UILabel *label;

- (CalculatorButtonView *)setUp:(int)number;

@end
