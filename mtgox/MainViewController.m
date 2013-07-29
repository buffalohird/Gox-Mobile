//
//  MainViewController.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "MainViewController.h"

#define MENUWIDTH 320.0
#define MENUHEIGHT 200.0
#define MENUDOWNY 44.0
#define MENUUPY -156.0

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize bidView = _bidView;
@synthesize askView = _askView;
@synthesize navBar = _navBar;
@synthesize currencyNavButton = _currencyNavButton;
@synthesize menuView = _menuView;
@synthesize balanceView = _balanceView;
@synthesize tradeView = _tradeView;
@synthesize calculatorView = _calculatorView;
@synthesize aboutView = _aboutView;
@synthesize menuButtonView = _menuButtonView;
@synthesize toggleMenuBool = _toggleMenuBool;
@synthesize toggleBalanceBool = _toggleBalanceBool;
@synthesize alertView = _alertView;
@synthesize mtGox = _mtGox;
@synthesize goxTimer = _goxTimer;
@synthesize timerInterval = _timerInterval;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *newKey = @"new key";
    NSString *newSecret = @"new secret";
    //NSLog([NSString stringWithFormat:@"Key: %@, Secret: %@", self.mtGox.key, self.mtGox.secret]);
    self.mtGox = [[MtGox alloc] initWithKey:newKey andSecret:newSecret];
    
    self.menuView = [[MenuView alloc] init];
    [self.menuView setUp];
    //[self.menuView setHidden:TRUE];
    [self.view insertSubview:self.menuView belowSubview:self.navBar];
    
    MenuButtonView *newMenuButton = [self.menuView addMenuButton:0 withIndex: 0];
    [newMenuButton addTarget:self
                      action:@selector(presentHomeView)
            forControlEvents:UIControlEventTouchUpInside];

    newMenuButton = [self.menuView addMenuButton:MENUHEIGHT / 4 withIndex: 1];
    [newMenuButton addTarget:self
                      action:@selector(presentTradeView)
            forControlEvents:UIControlEventTouchUpInside];
    
    newMenuButton = [self.menuView addMenuButton:MENUHEIGHT / 2 withIndex: 2];
    [newMenuButton addTarget:self
                      action:@selector(presentCalculatorView)
            forControlEvents:UIControlEventTouchUpInside];
    newMenuButton = [self.menuView addMenuButton:3 * MENUHEIGHT / 4 withIndex: 3];
    [newMenuButton addTarget:self
                      action:@selector(presentAboutView)
            forControlEvents:UIControlEventTouchUpInside];
    
    
    self.menuButtonView  = [[UIView alloc] init];
    self.menuButtonView.frame = CGRectMake(5.0, 5.0, 34.0, 34.0);
    self.menuButtonView.backgroundColor = [UIColor greenColor];
    self.menuButtonView.layer.cornerRadius = 2.0f;
    self.menuButtonView.layer.masksToBounds = YES;
    self.menuButtonView.layer.borderWidth = 1.0f;
    self.menuButtonView.layer.borderColor = [self.menuButtonView.backgroundColor CGColor];
    [self.view insertSubview:self.menuButtonView aboveSubview:self.navBar];
    
    UITapGestureRecognizer *menuTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMenuView)];
    menuTapGestureRecognizer.numberOfTapsRequired = 1;
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width/4 * 3, 44);
    UIView *navBarTapView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:navBarTapView];
    navBarTapView.backgroundColor = [UIColor clearColor];
    [navBarTapView setUserInteractionEnabled:YES];
    [navBarTapView addGestureRecognizer:menuTapGestureRecognizer];
    
    self.balanceView = [[BalanceView alloc] init];
    [self.balanceView setUp:self.mtGox];
    [self.view insertSubview:self.balanceView belowSubview:self.navBar];
    //[self.balanceView setHidden:TRUE];
    self.balanceView.alpha = 0;
    
    BalanceViewItem *newBalanceItem = [self.balanceView addBalanceItem:0 withPosY: 10.0];
    newBalanceItem = [self.balanceView addBalanceItem:1 withPosY: 60.0];
    newBalanceItem = [self.balanceView addBalanceItem:2 withPosY: 110.0];
    
    UITapGestureRecognizer *emptyTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAllViews)];
    menuTapGestureRecognizer.numberOfTapsRequired = 1;
    CGRect emptyFrame = CGRectMake(0, 0, 320, 480);
    TransparentView *emptyTapView = [[TransparentView alloc] initWithFrame:emptyFrame];
    [self.view insertSubview:emptyTapView belowSubview: self.menuView];
    emptyTapView.backgroundColor = [UIColor clearColor];
    [emptyTapView setUserInteractionEnabled:YES];
    [emptyTapView addGestureRecognizer:emptyTapGestureRecognizer];
    
    self.bidView = [[OrderView alloc] init];
    [self.bidView createOrderView:CGRectMake(0.0, 100.0, self.view.bounds.size.width, 175.0) andName:@"Bids" andGox:self.mtGox];
    [self.view insertSubview:self.bidView belowSubview:self.menuView];
    
    

    self.askView = [[OrderView alloc] init];
    [self.askView createOrderView:CGRectMake(0.0, 280.0, self.view.bounds.size.width, 175.0) andName:@"Asks" andGox:self.mtGox];
    [self.view insertSubview:self.askView belowSubview:self.menuView];
    
    self.alertView = [[AlertView alloc] init];
    [self.alertView createAlertView];
    [self.view insertSubview:self.alertView aboveSubview:self.menuView];
    
    self.tradeView = [[TradeView alloc] init];
    [self.tradeView createTradeView: self.mtGox];
    
    self.calculatorView = [[CalculatorView alloc] init];
    [self.calculatorView createCalculatorView: self.mtGox];
    
    self.aboutView = [[AboutView alloc] init];
    [self.aboutView createAboutView: self.mtGox];
    
    [self.view insertSubview:self.tradeView belowSubview:self.menuView];
    [self.view insertSubview:self.calculatorView belowSubview:self.menuView];
    [self.view insertSubview:self.aboutView belowSubview:self.menuView];
    
    self.timerInterval = 5.0;
    
    
    self.mtGox.loggedIn = YES; // temporary code
    [self checkLogin];
    [self refreshData];
    
    self.goxTimer = [NSTimer scheduledTimerWithTimeInterval:self.timerInterval target:self selector:@selector(refreshData) userInfo:nil repeats:YES];
    
    
}


- (IBAction)currencyNavButtonPressed:(id)sender
{
    if(self.mtGox.loggedIn){
        [self displayBalances];
    }
    else
        [self presentLogin];
    
    
}

- (void)checkLogin
{
    if(self.mtGox.loggedIn)
        self.currencyNavButton.title = @"$$";
    else
        self.currencyNavButton.title = @"Login";
}


- (void)displayBalances
{
    if(self.toggleBalanceBool){
        NSLog(@"hiding balance view");
        [self hideMenu];
        [self hideBalance];
        
    }
    else {
        NSLog(@"showing balance view");
        [self hideMenu];
        [self showBalance];
    }
    
    
}

- (void)showBalance
{
    self.toggleBalanceBool = TRUE;
    //[self.balanceView setHidden:FALSE];
    
    [UIView animateWithDuration:0.33 animations:^{
     self.balanceView.alpha = 1;
     }];
}

- (void)hideBalance
{
    self.toggleBalanceBool = FALSE;
    //[self.balanceView setHidden:TRUE];
    [UIView animateWithDuration:0.33 animations:^{
        self.balanceView.alpha = 0;
    }];
}

- (void)presentLogin
{
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    loginViewController.mtGox = self.mtGox;
    loginViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:loginViewController animated:YES completion:nil];
    
    
}

-(void)toggleMenuView
{
    if(self.toggleMenuBool){
        NSLog(@"hiding menu view");
        [self hideBalance];
        [self hideMenu];
    }
    else {
        NSLog(@"showing menu view");
        [self hideBalance];
        [self showMenu];
    }
    
    
}

-(void)showMenu
{
    self.toggleMenuBool = TRUE;
    
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.4f];
    self.menuView.frame = CGRectMake(0.0, MENUDOWNY, MENUWIDTH, MENUHEIGHT);
    [UIView commitAnimations];
           
}

-(void)hideMenu
{
    self.toggleMenuBool = FALSE;
    
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.4f];
    self.menuView.frame = CGRectMake(0.0, MENUUPY, MENUWIDTH, MENUHEIGHT);
    [UIView commitAnimations];
    
}

- (void)showAlert:(NSString *)alert withType:(int)type
{
    [self.alertView setAlpha:0.85];
    [self.alertView createAlert:alert withType:0];
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:1.25f];
    [self.alertView setAlpha:0.0];
    [UIView commitAnimations];
    
    
    
    
}

-(void)hideAllViews
{
    [self hideMenu];
    [self hideBalance];
    
    
}

- (void)presentHomeView
{
    [self hideAllViews];
    [self hideAllFullViews];
    self.navBar.topItem.title = @"Gox Mobile";
    
    
}
- (void)presentTradeView
{
    [self hideAllViews];
    [self hideAllFullViews];
    [self.tradeView setHidden:NO];
    self.navBar.topItem.title = @"Trade";

    
    
}
- (void)presentCalculatorView
{
    [self hideAllViews];
    [self hideAllFullViews];
    [self.calculatorView setHidden:NO];
    self.navBar.topItem.title = @"Calculator";
    
}
- (void)presentAboutView
{
    [self hideAllViews];
    [self hideAllFullViews];
    [self.aboutView setHidden:NO];
    self.navBar.topItem.title = @"About";
    
    
}

- (void)hideAllFullViews
{
    [self.tradeView setHidden:YES];
    [self.calculatorView setHidden:YES];
    [self.aboutView setHidden:YES];
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)refreshData
{
    // update models
    [self.mtGox refreshData];
    
    // update main
    float newLast = self.mtGox.lastPrice;
    float oldLast = [[self.currencyNavButton.title stripedOfSymbols] floatValue];
    if(newLast > oldLast)
        self.currencyNavButton.tintColor = [UIColor greenColor];
    else if(newLast < oldLast)
        self.currencyNavButton.tintColor = [UIColor redColor];
    else
        self.currencyNavButton.tintColor = [UIColor yellowColor];
    
    self.currencyNavButton.title = @" ";
    self.currencyNavButton.title =  [NSString stringWithFormat:@"$%f", newLast];
    
    [self showAlert:@"hello" withType:0];
    
    // update orders
    if(self.mtGox.counter) {
        [self.bidView refreshData:0];
        [self.askView refreshData:1];
    }
        
    // update top views
    [self.balanceView refreshData];
    
    
    // update independent views
    [self.calculatorView refreshData];
    [self.tradeView refreshData];
    [self.aboutView refreshData];
    
    // update database counter for conditional updates
    self.mtGox.counter++;
}

@end
