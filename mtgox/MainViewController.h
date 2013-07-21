//
//  MainViewController.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "FlipsideViewController.h"

#import <CoreData/CoreData.h>

#import "MtGox.h"
#import "MenuView.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) UIScrollView *bidView;
@property (strong, nonatomic) UIScrollView *askView;
@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *currencyNavButton;
@property (strong, nonatomic) MenuView *menuView;
@property (nonatomic) BOOL loggedIn;
@property (nonatomic) BOOL toggleMenuBool;


- (IBAction)currencyNavButtonPressed:(id)sender;
- (void)showBalances;
- (void)presentLogin;
- (void)toggleMenuView;

@end

