//
//  CalculatorView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/22/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "CalculatorView.h"

@implementation CalculatorView

@synthesize valueLabel = _valueLabel;
@synthesize previousValue = _previousValue;
@synthesize value = _value;
@synthesize trailingZeroes = _trailingZeroes;
@synthesize decimal = _decimal;
@synthesize decimalCount = _decimalCount;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CalculatorView *)createCalculatorView
{
    self.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    self.backgroundColor = [UIColor blackColor];
    
    self.value = 0.;
    self.trailingZeroes = 0;
    
    self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300.0, 40.0)];
    self.valueLabel.text = @"  $40.0355555";
    self.valueLabel.font = [UIFont boldSystemFontOfSize:14];
    self.valueLabel.textColor = [UIColor whiteColor];
    self.valueLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:self.valueLabel];
    
    self.valueLabel.layer.cornerRadius = 4.0f;
    self.valueLabel.layer.masksToBounds = YES;
    self.valueLabel.layer.borderWidth = 2.0f;
    self.valueLabel.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    
    for(int i = 0; i < 18; i++) {
        CalculatorButtonView *newCalculatorButton = [[CalculatorButtonView alloc] init];
        [newCalculatorButton setUp:i];
        [newCalculatorButton setTag:i];
        if(i == 10) {
            [newCalculatorButton addTarget:self action:@selector(clearCalculator) forControlEvents:UIControlEventTouchUpInside];
        }
        else if(i == 12 || i == 13 || i == 14 || i == 15){
            [newCalculatorButton addTarget:self action:@selector(enterOperation:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if(i == 16)
            [newCalculatorButton addTarget:self action:@selector(commitOperation) forControlEvents:UIControlEventTouchUpInside];
        else 
            [newCalculatorButton addTarget:self action:@selector(calculatorButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:newCalculatorButton];
    }
    
    [self setHidden:YES];
    return self;
    
}



- (int)calculatorButtonPressed:(CalculatorButtonView *)pressedButton
{
    int index = pressedButton.tag;
    
    if(index == 11) {
        self.decimal = YES;
        if (self.value == 0) {
            self.valueLabel.text = [NSString stringWithFormat:@"  %f", 0.0];
        }
    }
    else {
        if(self.decimal == YES) {
            self.decimalCount++;
            self.value = self.value + (float) index * pow(0.1, (float)self.decimalCount);
        }
        else {
            self.value = self.value * 10 + (float) index;
        }
        self.valueLabel.text = [NSString stringWithFormat:@"  %f", self.value];
        return pressedButton.tag;
    }
    
    return pressedButton.tag;
}

- (void)registerCalculatorPress:(NSString *)character
{
    NSString *oldText = self.valueLabel.text;
    self.valueLabel.text = [oldText stringByAppendingString:character];
    
}


-(void)renderLabel
{
    
    
    
}
- (void)clearCalculator
{
    self.valueLabel.text = @"  ";
    self.value = 0.;
    self.trailingZeroes = 0;
    self.currentOperation = 0;
    [self resetDecimal];
}

- (void)enterOperation:(CalculatorButtonView *)pressedOperation
{
    int operation = pressedOperation.tag - 11;
    if(self.previousValue != 0)
        [self commitOperation];
    self.previousValue = self.value;
    self.value = 0;
    [self resetDecimal];
    if(operation == 1) {
        self.valueLabel.text = @"  +";
        self.currentOperation = 1;
    }
    else if(operation == 2) {
        self.valueLabel.text = @"  -";
        self.currentOperation = 2;
    }
    else if(operation == 3) {
        self.valueLabel.text = @"  *";
        self.currentOperation = 3;
    }
    else if(operation == 4) {
        self.valueLabel.text = @"  /";
        self.currentOperation = 4;
    }
    
    
}

- (void)commitOperation
{
    if(self.currentOperation == 1) {
        self.value = self.previousValue + self.value;
        self.valueLabel.text = [NSString stringWithFormat:@"  %f", self.value];
    }
    else if(self.currentOperation == 2) {
        self.value = self.previousValue - self.value;
        self.valueLabel.text = [NSString stringWithFormat:@"  %f", self.value];
    }
    else if(self.currentOperation == 3) {
        self.value = self.previousValue * self.value;
        self.valueLabel.text = [NSString stringWithFormat:@"  %f", self.value];
    }
    else if(self.currentOperation == 4) {
        self.value = self.previousValue / self.value;
        self.valueLabel.text = [NSString stringWithFormat:@"  %f", self.value];
    }
    
    if(self.value == INFINITY){
        [self clearCalculator];
        self.valueLabel.text = [NSString stringWithFormat:@"  Error: Number Too Large"];
    }
}

- (void)resetDecimal
{
    self.decimal = NO;
    self.decimalCount = 0;
    
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
