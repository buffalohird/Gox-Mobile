//
//  LoginViewController.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

//@synthesize mainViewController = _mainViewController;
@synthesize mtGox = _mtGox;
@synthesize keyTextField = _keyTextField;
@synthesize secretTextField = _secretTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)attemptLogin
{
    [self.view endEditing:YES];
    NSString *key = self.keyTextField.text;
    NSString *secret = self.secretTextField.text;
    NSLog([NSString stringWithFormat:@"attempting to connect with key %@ and secret %@", key, secret]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissLoginView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
