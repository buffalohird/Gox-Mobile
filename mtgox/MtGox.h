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

- (id)initWithKey:(NSString *)key andSecret:(NSString *)secret;

- (int)callURL:(NSString *)urlString;

@end