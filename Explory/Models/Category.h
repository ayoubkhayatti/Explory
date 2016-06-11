//
//  Category.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Icon.h"

@interface Category : NSObject

@property (nonatomic, strong) Icon * icon;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * pluralName;
@property (nonatomic, assign) BOOL primary;
@property (nonatomic, strong) NSString * shortName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end