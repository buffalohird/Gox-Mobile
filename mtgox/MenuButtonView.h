//
//  MenuButtonView.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MenuButtonView : UIButton {
    CALayer *highlightLayer;
    
}

- (void)createHighlightLayer;
- (void)setHighlighted:(BOOL)highlight;
- (void)createBorder;

@end
