//
//  menuView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuButtonView.h"

@interface MenuView : UIView
 
-(MenuView *)setUp;
-(MenuButtonView *)addMenuButton:(float)buttonTop withIndex:(int)index;
@end
