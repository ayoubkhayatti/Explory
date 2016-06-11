//
//  Icon.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Icon : NSObject

@property (nonatomic, strong) NSString * prefix;
@property (nonatomic, strong) NSString * suffix;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end