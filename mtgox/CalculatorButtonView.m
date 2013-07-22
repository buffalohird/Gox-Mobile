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

#define XPOS1 60
#define XPOS2 130
#define XPOS3 200

#define YPOS1 106
#define YPOS2 176
#define YPOS3 246
#define YPOS4 316

@implementation CalculatorButtonView

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
    switch (number) {
        case 1:
            chosenXPos = XPOS1;
            chosenYPos = YPOS1;
            break;
        case 2:
            chosenXPos = XPOS2;
            chosenYPos = YPOS1;
            break;
        case 3:
            chosenXPos = XPOS3;
            chosenYPos = YPOS1;
            break;
        case 4:
            chosenXPos = XPOS1;
            chosenYPos = YPOS2;
            break;
        case 5:
            chosenXPos = XPOS2;
            chosenYPos = YPOS2;
            break;
        case 6:
            chosenXPos = XPOS3;
            chosenYPos = YPOS2;
            break;
        case 7:
            chosenXPos = XPOS1;
            chosenYPos = YPOS3;
            break;
        case 8:
            chosenXPos = XPOS2;
            chosenYPos = YPOS3;
            break;
        case 9:
            chosenXPos = XPOS3;
            chosenYPos = YPOS3;
            break;
        case 0:
            chosenXPos = XPOS2;
            chosenYPos = YPOS4;
            break;
            
        default:
            NSLog(@"invalid digit given to CalculatorButtonView's Setup");
            break;
    }
    
    self.frame = CGRectMake(chosenXPos, chosenYPos, BUTTONWIDTH, BUTTONHEIGHT);
    self.backgroundColor = [UIColor grayColor];
    
    
    return self;
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
