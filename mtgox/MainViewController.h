//
//  MainViewController.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "MtGox.h"
#import "MenuView.h"
#import "BalanceView.h"
#import "BalanceViewItem.h"
#import "TransparentView.h"
#import "CalculatorButtonView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) UIScrollView *bidView;
@property (strong, nonatomic) UIScrollView *askView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *currencyNavButton;
@property (strong, nonatomic) MenuView *menuView;
@property (strong, nonatomic) BalanceView *balanceView;
@property (strong, nonatomic) UIView *tradeView;
@property (strong, nonatomic) UIView *calculatorView;
@property (strong, nonatomic) UIView *aboutView;

@property (nonatomic) BOOL loggedIn;
@property (nonatomic) BOOL toggleMenuBool;
@property (nonatomic) BOOL toggleBalanceBool;


- (IBAction)currencyNavButtonPressed:(id)sender;
- (void)displayBalances;
- (void)showBalance;
- (void)hideBalance;
- (void)presentLogin;
- (void)toggleMenuView;
- (void)showMenu;
- (void)hideMenu;
- (void)hideAllViews;
- (void)hideAllFullViews;
- (void)presentHomeView;
- (void)presentTradeView;
- (void)presentCalculatorView;
- (void)presentAboutView;
- (UIView *)createTradeView;
- (UIView *)createCalculatorView;
- (UIView *)createAboutView;


@end

