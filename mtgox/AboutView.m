//
//  AboutView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "AboutView.h"

@implementation AboutView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (AboutView *)createAboutView
{
    self.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    self.backgroundColor = [UIColor blackColor];
    
    UILabel *usLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300.0, 40.0)];
    usLabel.text = @"We are two college students with a love for computer science and bitcoins";
    usLabel.lineBreakMode = NSLineBreakByWordWrapping;
    usLabel.numberOfLines = 2;
    usLabel.textAlignment = UITextAlignmentCenter;
    usLabel.font = [UIFont boldSystemFontOfSize:14];
    usLabel.textColor = [UIColor whiteColor];
    usLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:usLabel];
    
    UILabel *donateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 300.0, 40.0)];
    donateLabel.text = @"Please consider donating bitcoins to this address:";
    donateLabel.lineBreakMode = NSLineBreakByWordWrapping;
    donateLabel.numberOfLines = 2;
    donateLabel.textAlignment = UITextAlignmentCenter;
    donateLabel.font = [UIFont boldSystemFontOfSize:14];
    donateLabel.textColor = [UIColor whiteColor];
    donateLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:donateLabel];
    
    UILabel *addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 300.0, 40.0)];
    addressLabel.text = @"Lxyijaefh0183248118041haeuofafa";
    addressLabel.textAlignment = UITextAlignmentCenter;
    addressLabel.font = [UIFont boldSystemFontOfSize:14];
    addressLabel.textColor = [UIColor whiteColor];
    addressLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:addressLabel];
    
    UILabel *openLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 250, 300.0, 40.0)];
    openLabel.text = @"We are dedicated to transparent, open source software:";
    openLabel.lineBreakMode = NSLineBreakByWordWrapping;
    openLabel.numberOfLines = 2;
    openLabel.textAlignment = UITextAlignmentCenter;
    openLabel.font = [UIFont boldSystemFontOfSize:14];
    openLabel.textColor = [UIColor whiteColor];
    openLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:openLabel];
    
    UIButton *sourceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sourceButton.frame = CGRectMake(10.0, 300.0, 300.0, 50.0);
    [sourceButton setTitle: @"View Source" forState: UIControlStateNormal];
    [self addSubview:sourceButton];

    
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
