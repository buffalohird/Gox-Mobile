//
//  TradeView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "TradeView.h"

@implementation TradeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (TradeView *)createTradeView
{
    self.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    self.backgroundColor = [UIColor blackColor];
    
    //make the Most Recent Order Label
    UILabel *recentOrderLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200.0, 20.0)];
    recentOrderLabel.text = @"Most Recent Order:";
    recentOrderLabel.font = [UIFont boldSystemFontOfSize:14];
    recentOrderLabel.textColor = [UIColor whiteColor];
    recentOrderLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:recentOrderLabel];

    //make the Balances Label
    UILabel *orderBalancesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200.0, 20.0)];
    orderBalancesLabel.text = @"Balances:";
    orderBalancesLabel.font = [UIFont boldSystemFontOfSize:14];
    orderBalancesLabel.textColor = [UIColor whiteColor];
    orderBalancesLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderBalancesLabel];

    
    
    
    //make the Size Label
    UILabel *orderSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 200.0, 20.0)];
    orderSizeLabel.text = @"Size:";
    orderSizeLabel.font = [UIFont boldSystemFontOfSize:14];
    orderSizeLabel.textColor = [UIColor whiteColor];
    orderSizeLabel.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer* onClick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(printQuote)];
    [orderSizeLabel setUserInteractionEnabled:YES];
    [orderSizeLabel addGestureRecognizer:onClick];
    
    [self addSubview:orderSizeLabel];

    
    // make the Size Input TextField
    UITextField *orderSizeInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 210, 200.0, 30.0)];
    orderSizeInput.backgroundColor = [UIColor whiteColor];
    orderSizeInput.placeholder = @"input Size of order";
    orderSizeInput.textColor = [UIColor blackColor];
    orderSizeInput.borderStyle =  UITextBorderStyleRoundedRect;
    orderSizeInput.layer.cornerRadius=8.0f;
    orderSizeInput.layer.masksToBounds=YES;
    orderSizeInput.layer.borderColor=[[UIColor redColor]CGColor];
    orderSizeInput.layer.borderWidth= 1.0f;
    [self addSubview:orderSizeInput];
    
    //make the size Button
    UIButton *orderSizeButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 215, 80.0, 20.0)];
    [orderSizeButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderSizeButton.backgroundColor = [UIColor redColor];
    [self addSubview:orderSizeButton];

    
    
    
    //make the Price Label
    UILabel *orderPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,245, 200.0, 20.0)];
    orderPriceLabel.text = @"Price:";
    orderPriceLabel.font = [UIFont boldSystemFontOfSize:14];
    orderPriceLabel.textColor = [UIColor whiteColor];
    orderPriceLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderPriceLabel];

    // make the Price Input TextField
    UITextField *orderPriceInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 265, 200.0, 30.0)];
    orderPriceInput.backgroundColor = [UIColor whiteColor];
    orderPriceInput.placeholder = @"input Price of order";
    orderPriceInput.textColor = [UIColor blackColor];
    orderPriceInput.borderStyle =  UITextBorderStyleRoundedRect;
    orderPriceInput.layer.cornerRadius=8.0f;
    orderPriceInput.layer.masksToBounds=YES;
    orderPriceInput.layer.borderColor=[[UIColor redColor]CGColor];
    orderPriceInput.layer.borderWidth= 1.0f;
    [self addSubview:orderPriceInput];

    //make the Price Button
    UIButton *orderPriceButton = [[UIButton alloc] initWithFrame:CGRectMake(230,270, 80.0, 20.0)];
    [orderPriceButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderPriceButton.backgroundColor = [UIColor redColor];
    [self addSubview:orderPriceButton];
    
    
    
    
    //make the Total Label
    UILabel *orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 200.0, 20.0)];
    orderTotalLabel.text = @"Total:";
    orderTotalLabel.font = [UIFont boldSystemFontOfSize:14];
    orderTotalLabel.textColor = [UIColor whiteColor];
    orderTotalLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderTotalLabel];
    
    // make the Total Input TextField
    UITextField *orderTotalInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 320, 200.0, 30.0)];
    orderTotalInput.backgroundColor = [UIColor whiteColor];
    orderTotalInput.placeholder = @"input Total of order";
    orderTotalInput.textColor = [UIColor blackColor];
    orderTotalInput.borderStyle =  UITextBorderStyleRoundedRect;
    orderTotalInput.layer.cornerRadius=8.0f;
    orderTotalInput.layer.masksToBounds=YES;
    orderTotalInput.layer.borderColor=[[UIColor redColor]CGColor];
    orderTotalInput.layer.borderWidth= 1.0f;
    [self addSubview:orderTotalInput];
    
    //make the Total Button
    UIButton *orderTotalButton = [[UIButton alloc] initWithFrame:CGRectMake(230,325, 80.0, 20.0)];
    [orderTotalButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderTotalButton.backgroundColor = [UIColor redColor];
    [self addSubview:orderTotalButton];

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

- (void) printQuote
{
    MtGox *mtgox = [[MtGox alloc] init];
    [mtgox callURL:@"https://data.mtgox.com/api/2/BTCUSD/money/ticker_fast"];
}

@end
