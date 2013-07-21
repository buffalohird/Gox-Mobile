//
//  MainViewController.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize bidView = _bidView;
@synthesize askView = _askView;
@synthesize navBar = _navBar;
@synthesize currencyNavButton = _currencyNavButton;
@synthesize menuView = _menuView;
@synthesize loggedIn = _loggedIn;
@synthesize toggleMenuBool = _toggleMenuBool;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.menuView = [[MenuView alloc] init];
    [self.menuView setUp];
    [self.menuView setHidden:TRUE];
    [self.view addSubview:self.menuView];
    
    
    UITapGestureRecognizer *menuTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMenuView)];
    menuTapGestureRecognizer.numberOfTapsRequired = 1;
    CGRect frame = CGRectMake(self.view.frame.size.width/4, 0, self.view.frame.size.width/2, 44);
    UIView *navBarTapView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:navBarTapView];
    navBarTapView.backgroundColor = [UIColor clearColor];
    [navBarTapView setUserInteractionEnabled:YES];
    [navBarTapView addGestureRecognizer:menuTapGestureRecognizer];
    
    self.bidView = [[UIScrollView alloc] init];
    self.bidView.frame = CGRectMake(0.0, 100.0, self.view.bounds.size.width, 175.0);
    self.bidView.contentSize = CGSizeMake(400, 800);   //scroll view size
    self.bidView.backgroundColor = [UIColor grayColor];
    self.bidView.showsVerticalScrollIndicator = YES;    // to hide scroll indicators!
    self.bidView.showsHorizontalScrollIndicator = NO; //by default, it shows!
    self.bidView.scrollEnabled = YES;                 //say "NO" to disable scroll
    [self.view insertSubview:self.bidView belowSubview:self.menuView];               //adding to parent vie
    
    self.askView = [[UIScrollView alloc] init];
    self.askView.frame = CGRectMake(0.0, 280.0, self.view.bounds.size.width, 175.0);
    self.askView.contentSize = CGSizeMake(400, 800);   //scroll view size
    self.askView.backgroundColor = [UIColor grayColor];
    self.askView.showsVerticalScrollIndicator = YES;    // to hide scroll indicators!
    self.askView.showsHorizontalScrollIndicator = NO; //by default, it shows!
    self.askView.scrollEnabled = YES;                 //say "NO" to disable scroll
    [self.view insertSubview:self.askView belowSubview:self.menuView];
    
    
    
    
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
        [self showBalances];
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


- (void)showBalances
{
    
    
    
}

- (void)presentLogin
{
    
    
    
}

-(void)toggleMenuView
{
    if(self.toggleMenuBool){
        NSLog(@"hiding menu view");
        self.toggleMenuBool = FALSE;
        [self.menuView setHidden:FALSE];
        
    }
    else {
        NSLog(@"showing menu view");
        self.toggleMenuBool = TRUE;
        [self.menuView setHidden:TRUE];
    }
    
    
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
