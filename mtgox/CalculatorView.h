//
//  CalculatorView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/22/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CalculatorButtonView.h"

@interface CalculatorView : UIView

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic) float previousValue;
@property (nonatomic) float value;
@property (nonatomic) int trailingZeroes;
@property (nonatomic) int currentOperation;
@property (nonatomic) BOOL decimal;
@property (nonatomic) int decimalCount;

- (CalculatorView *)createCalculatorView;
- (int) calculatorButtonPressed:(CalculatorButtonView *)pressedButton;
- (void)registerCalculatorPress:(NSString *)character;
- (void)renderLabel;
- (void)clearCalculator;
- (void)enterOperation:(CalculatorButtonView *)pressedOperation;
- (void)commitOperation;
- (void)resetDecimal;

@end
