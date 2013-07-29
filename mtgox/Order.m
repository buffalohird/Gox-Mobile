//
//  Order.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "Order.h"

@implementation Order

@synthesize price = _price;
@synthesize size = _size;
@synthesize total = _total;

- (id)initWithPrice:(float)price andSize:(float)size andTotal:(float)total
{
    self = [super init];
    
    self.price = price;
    self.size = size;
    self.total = total;
    
    return self;
}

- (NSArray *)combineOrders:(NSArray *)orderArray
{
    NSArray *returnArray = [[NSArray alloc] init];
    for(NSDictionary *order in orderArray)
    {
        
        
    }
    
    return returnArray;
}
@end
