//
//  Order.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (nonatomic) float price;
@property (nonatomic) float size;
@property (nonatomic) float total;

- (id)initWithPrice:(float)price andSize:(float)size andTotal:(float)total;

@end
