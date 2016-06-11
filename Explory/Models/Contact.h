//
//  Contact.h
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSString * formattedPhone;
@property (nonatomic, strong) NSString * phone;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end