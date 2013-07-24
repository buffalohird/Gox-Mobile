//
//  CalculatorButtonView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/22/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "CalculatorButtonView.h"

#define BUTTONWIDTH 60
#define BUTTONHEIGHT 60

#define XPOS1 25
#define XPOS2 95
#define XPOS3 165
#define XPOS4 235

#define YPOS1 106
#define YPOS2 176
#define YPOS3 246
#define YPOS4 316
#define YPOS5 386

@implementation CalculatorButtonView

@synthesize label = _label;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CalculatorButtonView *)setUp:(int)number
{
    int chosenXPos, chosenYPos;
    NSString *buttonLabel;
    switch (number) {
        case 1:
            chosenXPos = XPOS1;
            chosenYPos = YPOS1;
            buttonLabel = @"1";
            break;
        case 2:
            chosenXPos = XPOS2;
            chosenYPos = YPOS1;
            buttonLabel = @"2";
            break;
        case 3:
            chosenXPos = XPOS3;
            chosenYPos = YPOS1;
            buttonLabel = @"3";
            break;
        case 4:
            chosenXPos = XPOS1;
            chosenYPos = YPOS2;
            buttonLabel = @"4";
            break;
        case 5:
            chosenXPos = XPOS2;
            chosenYPos = YPOS2;
            buttonLabel = @"5";
            break;
        case 6:
            chosenXPos = XPOS3;
            chosenYPos = YPOS2;
            buttonLabel = @"6";
            break;
        case 7:
            chosenXPos = XPOS1;
            chosenYPos = YPOS3;
            buttonLabel = @"7";
            break;
        case 8:
            chosenXPos = XPOS2;
            chosenYPos = YPOS3;
            buttonLabel = @"8";
            break;
        case 9:
            chosenXPos = XPOS3;
            chosenYPos = YPOS3;
            buttonLabel = @"9";
            break;
        case 0:
            chosenXPos = XPOS2;
            chosenYPos = YPOS4;
            buttonLabel = @"0";
            break;
        case 10: // clear button
            chosenXPos = XPOS1;
            chosenYPos = YPOS4;
            buttonLabel = @"C";
            break;
        case 11: // decimal button
            chosenXPos = XPOS3;
            chosenYPos = YPOS4;
            buttonLabel = @".";
            break;
        case 12: // add button
            chosenXPos = XPOS4;
            chosenYPos = YPOS1;
            buttonLabel = @"+";
            break;
        case 13: // subtract button
            chosenXPos = XPOS4;
            chosenYPos = YPOS2;
            buttonLabel = @"-";
            break;
        case 14: // multiply button
            chosenXPos = XPOS4;
            chosenYPos = YPOS3;
            buttonLabel = @"*";
            break;
        case 15: // divide button
            chosenXPos = XPOS4;
            chosenYPos = YPOS4;
            buttonLabel = @"/";
            break;
        case 16: // enter button
            chosenXPos = XPOS2;
            chosenYPos = YPOS5;
            buttonLabel = @"Enter";
            break;
        default:
            NSLog(@"invalid digit given to CalculatorButtonView's Setup");
            break;
    }
    
    self.frame = CGRectMake(chosenXPos, chosenYPos, BUTTONWIDTH, BUTTONHEIGHT);
    self.backgroundColor = [UIColor grayColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, BUTTONWIDTH, BUTTONHEIGHT)];
    self.label.text = buttonLabel;
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = UITextAlignmentCenter;
    
    [self addSubview:self.label];
    
    [self createHighlightLayer];
    
    return self;
}

- (void)createHighlightLayer
{
    // what happens when the user clicks. make the settings
    highlightLayer = [CALayer layer];
    highlightLayer.backgroundColor = [UIColor colorWithRed: 0.10f
                                                     green: 0.10f
                                                      blue: 0.10f
                                                     alpha: 0.60].CGColor;
    highlightLayer.frame = self.layer.bounds;
    highlightLayer.hidden = YES;
    
    // insert it
    [self.layer insertSublayer:highlightLayer above:self.layer];
}

- (void)setHighlighted:(BOOL)highlight
{
    highlightLayer.hidden = !highlight;
    [super setHighlighted:highlight];
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
