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
@synthesize counter = _counter;


// public
@synthesize loggedIn = _loggedIn;
@synthesize lastPrice = _lastPrice;
@synthesize dollarBalance = _dollarBalance;
@synthesize bitcoinBalance = _bitcoinBalance;
@synthesize monthlyVolume = _monthlyVolume;
@synthesize tradeFee = _tradeFee;
@synthesize language = _language;
@synthesize rights = _rights;
@synthesize asks = _asks;
@synthesize bids = _bids;


// pretty stock setup function
- (id)initWithKey:(NSString *)key andSecret:(NSString *)secret
{
    self = [super init];
    
    self.agent = @"btc_bot";
    self.key = key;
    self.secret = secret;
    self.base = @"https://data.mtgox.com/api/2/";
    self.counter = 0;
    
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


- (int)updateUserData
{
    NSString *userStringEnd = @"BTCUSD/money/info";
    NSString *userString = [NSString stringWithFormat:@"%@%@", self.base, userStringEnd];
    NSDictionary *userDictionary = [self callURL:userString];
    
    self.dollarBalance = [userDictionary[@"Wallets"][@"USD"][@"Balance"][@"Value"] floatValue];
    self.bitcoinBalance = [userDictionary[@"Wallets"][@"BTC"][@"Balance"][@"Value"] floatValue];
    self.monthlyVolume = [userDictionary[@"Monthly_Volume"][@"Value"] floatValue];
    self.tradeFee = [userDictionary[@"Trade_Fee"] floatValue];
    self.language = userDictionary[@"Language"];
    self.rights = userDictionary[@"Rights"];


    return 0;
}

- (int)updateMarketData
{
    NSString *currentStringEnd = @"BTCUSD/money/ticker";
    NSString *currentString = [NSString stringWithFormat:@"%@%@", self.base, currentStringEnd];
    NSDictionary *currentDictionary = [self callURL:currentString];
    
    self.lastPrice = [currentDictionary[@"last"][@"value"] floatValue];
    
    
    return 0;
}

- (int)updateOrderData
{
    NSString *orderStringEnd = @"BTCUSD/money/depth/fetch"; // add the correct call to receive new orders
    NSString *orderString = [NSString stringWithFormat:@"%@%@", self.base, orderStringEnd];
    NSDictionary *orderDictionary = [self callURL:orderString];
    
    // insert order updates here
    
    self.asks = orderDictionary[@"asks"];
    self.bids = [[orderDictionary[@"bids"] reverseObjectEnumerator] allObjects];
    
    
    return 0;
}

- (NSString *)refreshData
{
    if(self.loggedIn)
    {
        
        /*
        if(self.counter % 20 == 0)
        {
            int checkUpdateUser = [self updateUserData];
            if(checkUpdateUser != 0)
                NSLog(@"MTGOX: error updating user, error code %d given", checkUpdateUser);
        }*/
    }
    else
    {
        
    }
    

    int checkUpdateMarket = [self updateMarketData];
    if(checkUpdateMarket != 0)
        NSLog(@"MTGOX: error updating market, error code %d given", checkUpdateMarket);
    
    if(self.counter % 20 == 0)
    {
        int checkUpdateOrder = [self updateOrderData];
        if(checkUpdateOrder != 0)
            NSLog(@"MTGOX: error updating order, error code %d given", checkUpdateOrder);
        //NSLog(@"\n\n%@\n\n", self.asks);
        //NSLog(@"\n\n%@\n\n", self.bids);
        
    }
         
    
    //self.counter++;
    NSLog(@"gox counter: %d", self.counter);
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
