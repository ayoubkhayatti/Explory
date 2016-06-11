//
//  Stat.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Stat.h"

NSString *const kStatCheckinsCount = @"checkinsCount";
NSString *const kStatTipCount = @"tipCount";
NSString *const kStatUsersCount = @"usersCount";

@interface Stat ()
@end

@implementation Stat

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStatCheckinsCount] isKindOfClass:[NSNull class]]){
		self.checkinsCount = [dictionary[kStatCheckinsCount] integerValue];
	}

	if(![dictionary[kStatTipCount] isKindOfClass:[NSNull class]]){
		self.tipCount = [dictionary[kStatTipCount] integerValue];
	}

	if(![dictionary[kStatUsersCount] isKindOfClass:[NSNull class]]){
		self.usersCount = [dictionary[kStatUsersCount] integerValue];
	}

	return self;
}

@end