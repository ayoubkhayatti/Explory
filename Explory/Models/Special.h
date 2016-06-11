//
//  Special.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Special : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray * items;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end