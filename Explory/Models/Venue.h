//
//  Venue.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Category.h"
#import "Contact.h"
#import "HereNow.h"
#import "Location.h"
#import "Special.h"
#import "Stat.h"

@interface Venue : NSObject

@property (nonatomic, strong) NSArray * categories;
@property (nonatomic, strong) Contact * contact;
@property (nonatomic, strong) HereNow * hereNow;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) Location * location;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * referralId;
@property (nonatomic, strong) Special * specials;
@property (nonatomic, strong) Stat * stats;
@property (nonatomic, strong) NSString * url;
@property (nonatomic, strong) NSArray * venueChains;
@property (nonatomic, assign) BOOL verified;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray*)parseSearchResponse:(id)response;

@end