//
//  HereNow.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HereNow : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSArray * groups;
@property (nonatomic, strong) NSString * summary;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end