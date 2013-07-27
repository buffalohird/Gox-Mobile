//
//  TradeView.m
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "TradeView.h"

@implementation TradeView

@synthesize orderSizeInput = _orderSizeInput;
@synthesize orderPriceInput = _orderPriceInput;
@synthesize orderTotalInput = _orderTotalInput;

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

    //make the Most Recent Order display label
    UILabel *recentOrderDisplayLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 300.0, 30.0)];
    recentOrderDisplayLabel.text = @"This is your most recent order. naht";
    recentOrderDisplayLabel.font = [UIFont boldSystemFontOfSize:14];
    recentOrderDisplayLabel.textColor = [UIColor greenColor];
    recentOrderDisplayLabel.backgroundColor = [UIColor blueColor];
    [self addSubview:recentOrderDisplayLabel];

    //make the Cancel Recent Order Button
    UIButton *cancelRecentOrderButton = [[UIButton alloc] initWithFrame:CGRectMake(220,60, 90.0, 20.0)];
    [cancelRecentOrderButton addTarget:self action:@selector(cancelRecentOrder) forControlEvents:UIControlEventTouchDown];
    [cancelRecentOrderButton setTitle:@"Cancel Order" forState:UIControlStateNormal];
    cancelRecentOrderButton.backgroundColor = [UIColor redColor];
    [self addSubview:cancelRecentOrderButton];
    
    
    
    //make the Balances Label
    UILabel *orderBalancesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200.0, 20.0)];
    orderBalancesLabel.text = @"Balances:";
    orderBalancesLabel.font = [UIFont boldSystemFontOfSize:14];
    orderBalancesLabel.textColor = [UIColor whiteColor];
    orderBalancesLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderBalancesLabel];
    
    //make the Dollar Balance Button
    UIButton *dollarBalanceButton = [[UIButton alloc] initWithFrame:CGRectMake(20,130, 115.0, 20.0)];
    [dollarBalanceButton addTarget:self action:@selector(useBalanceInOrder:) forControlEvents:UIControlEventTouchDown];
    [dollarBalanceButton setTitle:@"40000" forState:UIControlStateNormal];
    dollarBalanceButton.backgroundColor = [UIColor redColor];
    dollarBalanceButton.tag = 1;
    [self addSubview:dollarBalanceButton];
    
    //make the BTC Balance Button
    UIButton *btcBalanceButton = [[UIButton alloc] initWithFrame:CGRectMake(200,130, 80.0, 20.0)];
    [btcBalanceButton addTarget:self action:@selector(useBalanceInOrder:) forControlEvents:UIControlEventTouchDown];
    [btcBalanceButton setTitle:@"80" forState:UIControlStateNormal];
    btcBalanceButton.backgroundColor = [UIColor redColor];
    btcBalanceButton.tag = 2;
    [self addSubview:btcBalanceButton];

    
    
    
    //make the Size Label
    UILabel *orderSizeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 200.0, 20.0)];
    orderSizeLabel.text = @"Size:";
    orderSizeLabel.font = [UIFont boldSystemFontOfSize:14];
    orderSizeLabel.textColor = [UIColor whiteColor];
    orderSizeLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderSizeLabel];
    
    /*
    UITapGestureRecognizer* onClickSizeLabel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(printQuote)];
    [orderSizeLabel setUserInteractionEnabled:YES];
    [orderSizeLabel addGestureRecognizer:onClickSizeLabel];
*/
    
    // make the Size Input TextField
    self.orderSizeInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 210, 200.0, 30.0)];
    [self.orderSizeInput setKeyboardType:UIKeyboardTypeDecimalPad];
    self.orderSizeInput.backgroundColor = [UIColor whiteColor];
    self.orderSizeInput.placeholder = @"input Size of order";
    self.orderSizeInput.textColor = [UIColor blackColor];
    self.orderSizeInput.borderStyle =  UITextBorderStyleRoundedRect;
    self.orderSizeInput.layer.cornerRadius=8.0f;
    self.orderSizeInput.layer.masksToBounds=YES;
    self.orderSizeInput.layer.borderColor=[[UIColor redColor]CGColor];
    self.orderSizeInput.layer.borderWidth= 1.0f;
    [self addSubview:self.orderSizeInput];
    
    //make the Size Calc Button
    UIButton *orderSizeButton = [[UIButton alloc] initWithFrame:CGRectMake(230,215, 80.0, 20.0)];
    [orderSizeButton addTarget:self action:@selector(calcOrder:) forControlEvents:UIControlEventTouchDown];
    [orderSizeButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderSizeButton.backgroundColor = [UIColor redColor];
    orderSizeButton.tag = 1;
    [self addSubview:orderSizeButton];
    
    
    
    
    //make the Price Label
    UILabel *orderPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,245, 200.0, 20.0)];
    orderPriceLabel.text = @"Price:";
    orderPriceLabel.font = [UIFont boldSystemFontOfSize:14];
    orderPriceLabel.textColor = [UIColor whiteColor];
    orderPriceLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderPriceLabel];

    // make the Price Input TextField
    self.orderPriceInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 265, 200.0, 30.0)];
    [self.orderPriceInput setKeyboardType:UIKeyboardTypeDecimalPad];
    self.orderPriceInput.backgroundColor = [UIColor whiteColor];
    self.orderPriceInput.placeholder = @"input Price of order";
    self.orderPriceInput.textColor = [UIColor blackColor];
    self.orderPriceInput.borderStyle =  UITextBorderStyleRoundedRect;
    self.orderPriceInput.layer.cornerRadius=8.0f;
    self.orderPriceInput.layer.masksToBounds=YES;
    self.orderPriceInput.layer.borderColor=[[UIColor redColor]CGColor];
    self.orderPriceInput.layer.borderWidth= 1.0f;
    [self addSubview:self.orderPriceInput];

    //make the Price Calc Button
    UIButton *orderPriceButton = [[UIButton alloc] initWithFrame:CGRectMake(230,270, 80.0, 20.0)];
    [orderPriceButton addTarget:self action:@selector(calcOrder:) forControlEvents:UIControlEventTouchDown];
    [orderPriceButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderPriceButton.backgroundColor = [UIColor redColor];
    orderPriceButton.tag = 2;
    [self addSubview:orderPriceButton];
    
    
    
    
    
    //make the Total Label
    UILabel *orderTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 200.0, 20.0)];
    orderTotalLabel.text = @"Total:";
    orderTotalLabel.font = [UIFont boldSystemFontOfSize:14];
    orderTotalLabel.textColor = [UIColor whiteColor];
    orderTotalLabel.backgroundColor = [UIColor blackColor];
    [self addSubview:orderTotalLabel];
    
    // make the Total Input TextField
    self.orderTotalInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 320, 200.0, 30.0)];
    [self.orderTotalInput setKeyboardType:UIKeyboardTypeDecimalPad];
    self.orderTotalInput.backgroundColor = [UIColor whiteColor];
    self.orderTotalInput.placeholder = @"input Total of order";
    self.orderTotalInput.textColor = [UIColor blackColor];
    self.orderTotalInput.borderStyle =  UITextBorderStyleRoundedRect;
    self.orderTotalInput.layer.cornerRadius=8.0f;
    self.orderTotalInput.layer.masksToBounds=YES;
    self.orderTotalInput.layer.borderColor=[[UIColor redColor]CGColor];
    self.orderTotalInput.layer.borderWidth= 1.0f;
    [self addSubview:self.orderTotalInput];
    
    //make the Total Calc Button
    UIButton *orderTotalButton = [[UIButton alloc] initWithFrame:CGRectMake(230,325, 80.0, 20.0)];
    [orderTotalButton addTarget:self action:@selector(calcOrder:) forControlEvents:UIControlEventTouchDown];
    [orderTotalButton setTitle:@"Calc" forState:UIControlStateNormal];
    orderTotalButton.backgroundColor = [UIColor redColor];
    orderTotalButton.tag = 3;
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

- (void) refreshData
{
    
    
}

- (void) useBalanceInOrder: (UIButton *) clickedBalance
{
    // tag is 1 or 2 if clicked balance was dollars or btc resp.
    if (clickedBalance.tag == 1)
        self.orderTotalInput.text = clickedBalance.currentTitle;
    else if (clickedBalance.tag == 2)
        self.orderSizeInput.text = clickedBalance.currentTitle;
    else
        NSLog(@"useBalanceInOrder run with weird tag");

}

- (void) calcOrder: (UIButton *) clickedSection
{
    NSLog(@"meow1");
    float size = [self.orderSizeInput.text floatValue];
    float price = [self.orderPriceInput.text floatValue];
    float total = [self.orderTotalInput.text floatValue];
    
    // tag equals 1,2,3 for click coming from calc size, price, total respectively
    if (clickedSection.tag == 1) {
        self.orderSizeInput.text = [NSString stringWithFormat:@"%f",total/price];
    }
    else if (clickedSection.tag == 2) {
        self.orderPriceInput.text =  [NSString stringWithFormat:@"%f",total/size];
    }
    else if (clickedSection.tag == 3 ) {
        self.orderTotalInput.text =  [NSString stringWithFormat:@"%f",size*price];
    } else {
        NSLog(@"calcOrder function called but tag is not 1,2,or 3");
    }
}

- (void) cancelRecentOrder
{
    NSLog(@"cancel the order damnit");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self endEditing:TRUE];
    
}

@end
