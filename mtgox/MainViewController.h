//
//  MainViewController.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "FlipsideViewController.h"
#import "NSString+StripedFloat.h"

#import <CoreData/CoreData.h>
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "MtGox.h"
#import "MenuView.h"
#import "BalanceView.h"
#import "BalanceViewItem.h"
#import "TransparentView.h"
#import "CalculatorButtonView.h"
#import "CalculatorView.h"
#import "AboutView.h"
#import "TradeView.h"
#import "OrderView.h"
#import "OrderViewItem.h"
#import "AlertView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) OrderView *bidView;
@property (strong, nonatomic) OrderView *askView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *currencyNavButton;
@property (strong, nonatomic) MenuView *menuView;
@property (strong, nonatomic) BalanceView *balanceView;
@property (strong, nonatomic) TradeView *tradeView;
@property (strong, nonatomic) CalculatorView *calculatorView;
@property (strong, nonatomic) AboutView *aboutView;
@property (strong, nonatomic) UIView *menuButtonView;
@property (strong, nonatomic) AlertView *alertView;
@property (strong, nonatomic) MtGox *mtGox;
@property (strong, nonatomic) NSTimer *goxTimer;

@property (nonatomic) BOOL toggleMenuBool;
@property (nonatomic) BOOL toggleBalanceBool;
@property (nonatomic) BOOL toggleBidBool;
@property (nonatomic) BOOL toggleAskBool;
@property (nonatomic) float timerInterval;


- (IBAction)currencyNavButtonPressed:(id)sender;
- (void)displayBalances;
- (void)showBalance;
- (void)hideBalance;
- (void)presentLogin;
- (void)toggleMenuView;
- (void)showMenu;
- (void)hideMenu;
- (void)showAlert:(NSString *)alert withType:(int)type;
- (void)hideAllViews;
- (void)hideAllFullViews;
- (void)presentHomeView;
- (void)presentTradeView;
- (void)presentCalculatorView;
- (void)presentAboutView;
- (void)refreshData;
- (void)toggleBidZoom;
- (void)showBidZoom;
- (void)hideBidZoom;
- (void)toggleAskZoom;
- (void)showAskZoom;
- (void)hideAskZoom;

@end

