//
//  OrderHeader.m
//  mtgox
//
//  Created by Buffalo Hird on 7/25/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "OrderHeader.h"

#define HEADERCATEGORYWIDTH 319.0 / 3.0
#define HEADERCATEGORYHEIGHT 20.0

@implementation OrderHeader

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (OrderHeader *)createOrderHeader:(NSString *)name
{
    self.frame = CGRectMake(0.0, 0.0, self.frame.size.width, 40.0);
    self.backgroundColor = [UIColor greenColor];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 20.0)];
    self.titleLabel.text = name;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor blackColor];
    self.titleLabel.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.titleLabel];
    
    [self createOrderCategory:CGRectMake(0.0, 20.0, HEADERCATEGORYWIDTH, HEADERCATEGORYHEIGHT) andIndex:0];
    [self createOrderCategory:CGRectMake(HEADERCATEGORYWIDTH + 1, 20.0, HEADERCATEGORYWIDTH, HEADERCATEGORYHEIGHT) andIndex:1];
    [self createOrderCategory:CGRectMake(2.0 * HEADERCATEGORYWIDTH + 2, 20.0, HEADERCATEGORYWIDTH, HEADERCATEGORYHEIGHT) andIndex:2];

    
    return self;
}

- (UIView *)createOrderCategory:(CGRect)rect andIndex:(int)index
{
    UIView *headerCategory = [[UIView alloc] init];
    headerCategory.frame = rect;
    [self addSubview:headerCategory];
    
    UIView *headerCategoryBorder = [[UIView alloc] init];
    headerCategoryBorder.frame = CGRectMake(rect.origin.x + HEADERCATEGORYWIDTH - 3.0,
                                            rect.origin.y,
                                            3.0,
                                            rect.size.height);
    
    headerCategoryBorder.backgroundColor = [UIColor blackColor];
    [self addSubview:headerCategoryBorder];
    
    UIView *headerCategoryBottom = [[UIView alloc] init];
    headerCategoryBottom.frame = CGRectMake(rect.origin.x - 1,
                                            rect.origin.y + rect.size.height - 3.0,
                                            rect.size.width,
                                            3.0);
    
    headerCategoryBottom.backgroundColor = [UIColor blackColor];
    [self addSubview:headerCategoryBottom];

    
    NSString *headerCategoryString = @"";
    switch (index) {
        case 0:
            headerCategoryString = @"Price";
            break;
        case 1:
            headerCategoryString = @"Size";
            break;
        case 2:
            headerCategoryString = @"Total";
            break;
        default:
            NSLog(@"invalid index for create order header category string");
            break;
    }
    
    UILabel* headerCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(rect.origin.x,
                                                                             rect.origin.y - 1.0,
                                                                             HEADERCATEGORYWIDTH,
                                                                             HEADERCATEGORYHEIGHT)];
    headerCategoryLabel.text = headerCategoryString;
    headerCategoryLabel.font = [UIFont boldSystemFontOfSize:14];
    headerCategoryLabel.textColor = [UIColor blackColor];
    headerCategoryLabel.textAlignment = UITextAlignmentCenter;
    headerCategoryLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:headerCategoryLabel];
    
    return headerCategory;
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
