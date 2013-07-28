//
//  NSString+NSString_StripedFloat.m
//  mtgox
//
//  Created by Buffalo Hird on 7/27/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "NSString+StripedFloat.h"

@implementation NSString (StripedFloat)

-(NSString *)stripedOfSymbols
{
    NSString *cleanedString = [self stringByTrimmingCharactersInSet: [NSCharacterSet symbolCharacterSet]];
    return cleanedString;
}

@end
