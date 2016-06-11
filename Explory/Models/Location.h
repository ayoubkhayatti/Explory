//
//  Location.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Location : NSObject

@property (nonatomic, strong) NSString * address;
@property (nonatomic, strong) NSString * cc;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSString * country;
@property (nonatomic, strong) NSString * crossStreet;
@property (nonatomic, assign) NSInteger distance;
@property (nonatomic, strong) NSArray * formattedAddress;
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;
@property (nonatomic, strong) NSString * postalCode;
@property (nonatomic, strong) NSString * state;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end