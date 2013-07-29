//
//  AlertView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/26/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

@synthesize label = _label;

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
    self.frame = CGRectMake(75.0, 50.0, 170.0, 40.0);
    self.backgroundColor = [UIColor darkGrayColor];
    
    [self setAlpha:0.0];
    
     self.layer.cornerRadius = 2.0f;
     self.layer.masksToBounds = YES;
     self.layer.borderWidth = 2.0f;
     self.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    self.label.text = @"";
    self.label.font = [UIFont boldSystemFontOfSize:12];
    self.label.textColor = [UIColor whiteColor];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.label];

    
    return self;
}

- (void)createAlert:(NSString *)alert withType:(int)type
{
    
    NSString *baseString;
    switch (type) {
        case 0:
            baseString = @"signed in succesfully";
            break;
        case 1:
            baseString = @"Bought:";
            break;
        case 2:
            baseString = @"Sold:";
            break;
            
        default:
            break;
    }
    
    self.label.text = baseString;
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
