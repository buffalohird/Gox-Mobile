//
//  MtGox.h
//  mtgox
//
//  Created by Buffalo Hird on 7/21/13.
//  Copyright (c) 2013 Buffalo Hird. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MtGox : NSObject

@property (strong, nonatomic) NSString* key;
@property (strong, nonatomic) NSString* secret;
@property (strong, nonatomic) NSString* agent;
@property (strong, nonatomic) NSString* reqs;
@property (strong, nonatomic) NSString* base;
@property (strong, nonatomic) NSString* time;
@property (nonatomic) int counter;

//***** outward API values *****

// read-write
@property (nonatomic) BOOL loggedIn;
// read-only
@property (nonatomic) float lastPrice;
@property (nonatomic) float dollarBalance;
@property (nonatomic) float bitcoinBalance;
@property (nonatomic) float monthlyVolume;
@property (nonatomic) float tradeFee;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSArray *rights;
@property (nonatomic, strong) NSArray *asks;
@property (nonatomic, strong) NSArray *bids;


- (id)initWithKey:(NSString *)key andSecret:(NSString *)secret;

- (NSDictionary *)callURL:(NSString *)urlString;
- (NSDictionary *)handleJsonData:(NSData *)data;
- (int)updateUserData;
- (int)updateMarketData;
- (int)updateOrderData;
- (NSString *)refreshData;
- (NSString *)getInfo;

@end