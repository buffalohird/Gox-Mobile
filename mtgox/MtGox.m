//
//  MtGox.m
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import "MtGox.h"

@implementation MtGox

@synthesize key = _key;
@synthesize secret = _secret;
@synthesize agent = _agent;
@synthesize reqs = _reqs;
@synthesize base = _base;
@synthesize time = _time;

@synthesize lastPrice = _lastPrice;

// pretty stock setup function
- (id)initWithKey:(NSString *)key andSecret:(NSString *)secret
{
    self = [super init];
    
    self.agent = @"btc_bot";
    self.key = key;
    self.secret = secret;
    self.base = @"https://data.mtgox.com/api/2/";
    
    return self;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (NSDictionary *)callURL:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSDictionary *returnDictionary = [self handleJsonData:data];
    return returnDictionary[@"data"];
}

- (NSDictionary *)handleJsonData:(NSData *)data
{    
    
    NSError *e = nil;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    return jsonDictionary;
}

- (int)login
{
    NSString *loginStringEnd = @"BTCUSD/money/ticker_fast";
    NSString *loginString = [NSString stringWithFormat:@"%@%@", self.base, loginStringEnd];
    NSDictionary *returnDictionary = [self callURL:loginString];
    
    
    return 0;
}

- (float)currentPrice
{
    NSString *currentStringEnd = @"BTCUSD/money/ticker";
    NSString *currentString = [NSString stringWithFormat:@"%@%@", self.base, currentStringEnd];
    NSDictionary *currentDictionary = [self callURL:currentString];
    
    NSMutableDictionary *returnDictionary = [[NSMutableDictionary alloc] init];
    returnDictionary[@"last"] = currentDictionary[@"last"];
    
    float lastPrice = [currentDictionary[@"last"][@"value"] floatValue];
    
    return lastPrice;
}

- (NSString *)refreshData
{
    self.lastPrice = [self currentPrice];
    
    
    NSLog(@"hello");
    return @"hello";
}

- (NSString *)getInfo
{
    NSString *infoStringEnd = @"BTCUSD/money/info";
    NSString *infoString = [NSString stringWithFormat:@"%@%@", self.base, infoStringEnd];
    NSDictionary *returnDictionary = [self callURL:infoString];
    
    
    return @"string";
}

@end
