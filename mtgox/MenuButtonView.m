//
//  MenuButtonView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "MenuButtonView.h"

@implementation MenuButtonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
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

- (void)createBorder
{
   /* self.layer.cornerRadius = 8.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 2.0f;
    self.layer.borderColor = [[UIColor whiteColor] CGColor];*/
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
