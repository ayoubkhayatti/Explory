//
//  Special.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Special.h"

NSString *const kSpecialCount = @"count";
NSString *const kSpecialItems = @"items";

@interface Special ()
@end

@implementation Special

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSpecialCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kSpecialCount] integerValue];
	}

	if(![dictionary[kSpecialItems] isKindOfClass:[NSNull class]]){
		self.items = dictionary[kSpecialItems];
	}	
	return self;
}

@end