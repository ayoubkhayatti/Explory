//
//  Stat.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stat : NSObject

@property (nonatomic, assign) NSInteger checkinsCount;
@property (nonatomic, assign) NSInteger tipCount;
@property (nonatomic, assign) NSInteger usersCount;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end