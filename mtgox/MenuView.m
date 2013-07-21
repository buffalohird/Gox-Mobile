//
//  menuView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "MenuView.h"

#define MENUWIDTH 320
#define MENUHEIGHT 200

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (MenuView *)setUp
{
    self.frame = CGRectMake(0, 44, MENUWIDTH, MENUHEIGHT);
    self.backgroundColor = [UIColor whiteColor];
    
    [self addMenuButton:0];
    [self addMenuButton:MENUHEIGHT / 4];
    [self addMenuButton:MENUHEIGHT / 2];
    [self addMenuButton:3 * MENUHEIGHT / 4];

    return self;
}

- (void)addMenuButton:(float)buttonTop
{
    MenuButtonView *newMenuButton = [[MenuButtonView alloc] init];
    newMenuButton.frame = CGRectMake(0, buttonTop, MENUWIDTH, MENUHEIGHT / 4);
    newMenuButton.backgroundColor = [UIColor greenColor];
    
    [self addSubview:newMenuButton];
    
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
