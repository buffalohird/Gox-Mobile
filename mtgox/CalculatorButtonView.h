//
//  CalculatorButtonView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/22/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CalculatorButtonView : UIButton {
    CALayer *highlightLayer;
}

@property (nonatomic, strong)UILabel *label;

- (CalculatorButtonView *)setUp:(int)number;
- (void)createHighlightLayer;
- (void)setHighlighted:(BOOL)highlight;

@end
