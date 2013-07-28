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
    self.frame = CGRectMake(0, -156.0, MENUWIDTH, MENUHEIGHT);
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

- (MenuButtonView *)addMenuButton:(float)buttonTop withIndex:(int)index
{
    MenuButtonView *newMenuButton = [[MenuButtonView alloc] init];
    float newMenuButtonHeight = MENUHEIGHT / 4 - 5;
    newMenuButton.frame = CGRectMake(0, buttonTop, MENUWIDTH, newMenuButtonHeight);
    newMenuButton.backgroundColor = [UIColor darkGrayColor];
    [newMenuButton createHighlightLayer];
    [newMenuButton createBorder];
    
    NSString *menuButtonText;
    switch(index){
        case 0:
            menuButtonText = @"Home";
            break;
        case 1:
            menuButtonText = @"Trade";
            break;
        case 2:
            menuButtonText = @"Calculator";
            break;
        case 3:
            menuButtonText = @"About";
            break;
        default:
            NSLog(@"invalid index for MenuViewButton");
            break;
    }
    
    UILabel *menuButtonLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MENUWIDTH, newMenuButtonHeight)];
    menuButtonLabel.text = menuButtonText;;
    menuButtonLabel.textColor = [UIColor whiteColor];
    menuButtonLabel.backgroundColor = [UIColor clearColor];
    menuButtonLabel.textAlignment = UITextAlignmentCenter;
    [newMenuButton addSubview:menuButtonLabel];
        
    [self addSubview:newMenuButton];
    
    UIView *newMenuButtonBottom = [[UIView alloc] init];
    newMenuButtonBottom.frame = CGRectMake(0.0, buttonTop + newMenuButtonHeight, MENUWIDTH, MENUHEIGHT / 4 - newMenuButtonHeight);
    newMenuButtonBottom.backgroundColor = [UIColor blackColor];
    
    [self addSubview:newMenuButtonBottom];
    
    return newMenuButton;
}

- (void)refreshData
{
    
    
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
