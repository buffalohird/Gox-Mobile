//
//  AlertView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/26/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (AlertView *)createAlertView
{
    
    [self setHidden:YES];
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
