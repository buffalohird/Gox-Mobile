//
//  LoginViewController.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "MtGox.h"

@interface LoginViewController : UIViewController

//@property (nonatomic, strong) MainViewController *mainViewController;
@property (nonatomic, strong) MtGox *mtGox;
@property (nonatomic, strong) IBOutlet UITextField *keyTextField;
@property (nonatomic, strong) IBOutlet UITextField *secretTextField;

- (IBAction)dismissLoginView:(id)sender;
- (IBAction)attemptLogin;

@end
