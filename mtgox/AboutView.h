//
//  AboutView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/24/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MtGox.h"

@interface AboutView : UIView

@property (nonatomic, strong) MtGox *mtGox;

- (AboutView *)createAboutView:(MtGox *)mtGox;
- (void)refreshData;

@end
