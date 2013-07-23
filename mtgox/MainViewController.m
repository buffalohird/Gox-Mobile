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
@synthesize loggedIn = _loggedIn;
@synthesize toggleMenuBool = _toggleMenuBool;
@synthesize toggleBalanceBool = _toggleBalanceBool;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    
    
    UITapGestureRecognizer *menuTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMenuView)];
    menuTapGestureRecognizer.numberOfTapsRequired = 1;
    CGRect frame = CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width/2, 44);
    UIView *navBarTapView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:navBarTapView];
    navBarTapView.backgroundColor = [UIColor clearColor];
    [navBarTapView setUserInteractionEnabled:YES];
    [navBarTapView addGestureRecognizer:menuTapGestureRecognizer];
    
    self.balanceView = [[BalanceView alloc] init];
    [self.balanceView setUp];
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
    
    self.bidView = [[UIScrollView alloc] init];
    self.bidView.frame = CGRectMake(0.0, 100.0, self.view.bounds.size.width, 175.0);
    self.bidView.contentSize = CGSizeMake(400, 800); 
    self.bidView.backgroundColor = [UIColor grayColor];
    self.bidView.showsVerticalScrollIndicator = YES;    
    self.bidView.showsHorizontalScrollIndicator = NO; 
    self.bidView.scrollEnabled = YES;               
    [self.view insertSubview:self.bidView belowSubview:self.menuView];
    
    self.askView = [[UIScrollView alloc] init];
    self.askView.frame = CGRectMake(0.0, 280.0, self.view.bounds.size.width, 175.0);
    self.askView.contentSize = CGSizeMake(400, 800);  
    self.askView.backgroundColor = [UIColor grayColor];
    self.askView.showsVerticalScrollIndicator = YES;    
    self.askView.showsHorizontalScrollIndicator = NO; 
    self.askView.scrollEnabled = YES;                 
    [self.view insertSubview:self.askView belowSubview:self.menuView];
    
    self.tradeView = [self createTradeView];
    
    self.calculatorView = [[CalculatorView alloc] init];
    [self.calculatorView createCalculatorView];
    
    self.aboutView = [self createAboutView];
    
    [self.view insertSubview:self.tradeView belowSubview:self.menuView];
    [self.view insertSubview:self.calculatorView belowSubview:self.menuView];
    [self.view insertSubview:self.aboutView belowSubview:self.menuView];
    
    
    NSString *newKey = @"new key";
    NSString *newSecret = @"new secret";
    MtGox *mtGox = [[MtGox alloc] initWithKey:newKey andSecret:newSecret];
    NSLog([NSString stringWithFormat:@"Key: %@, Secret: %@", mtGox.key, mtGox.secret]);
    
    self.loggedIn = TRUE;
    [self checkLogin];
    
}


- (IBAction)currencyNavButtonPressed:(id)sender
{
    if(self.loggedIn){
        [self displayBalances];
    }
    else
        [self presentLogin];
    
    
}

- (void)checkLogin
{
    if(self.loggedIn)
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
    
    /*[UIView animateWithDuration:0.5 animations:^{
     self.menuView.alpha = 1;
     }];*/
    
    
}

-(void)hideMenu
{
    self.toggleMenuBool = FALSE;
    
    [UIView beginAnimations:@"MoveView" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.4f];
    self.menuView.frame = CGRectMake(0.0, MENUUPY, MENUWIDTH, MENUHEIGHT);
    
    /*[UIView animateWithDuration:0.5 animations:^{
     self.menuView.alpha = 0;
     }];*/
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
    self.navBar.topItem.title = @"Trade";
    [self.tradeView setHidden:NO];
    
    
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
    
}

- (UIView *)createTradeView
{
    UIView *newTradeView = [[UIView alloc] init];
    newTradeView.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    newTradeView.backgroundColor = [UIColor redColor];
    
    
    [newTradeView setHidden:YES];
    return newTradeView;
}

- (UIView *)createAboutView
{
    UIView *newAboutView = [[UIView alloc] init];
    newAboutView.frame = CGRectMake(0.0, 44.0, 320.0, 436.0);
    newAboutView.backgroundColor = [UIColor greenColor];
    
    [newAboutView setHidden:YES];
    return newAboutView;
    
    
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

@end
