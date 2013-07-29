//
//  AlertView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/26/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface AlertView : UIView

@property (nonatomic, strong) UILabel *label;

- (AlertView *)createAlertView;
- (void)createAlert:(NSString *)alert withType:(int)type;



@end
