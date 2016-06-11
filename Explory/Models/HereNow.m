//
//  HereNow.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "HereNow.h"

NSString *const kHereNowCount = @"count";
NSString *const kHereNowGroups = @"groups";
NSString *const kHereNowSummary = @"summary";

@interface HereNow ()
@end

@implementation HereNow

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kHereNowCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kHereNowCount] integerValue];
	}

	if(![dictionary[kHereNowGroups] isKindOfClass:[NSNull class]]){
		self.groups = dictionary[kHereNowGroups];
	}	
	if(![dictionary[kHereNowSummary] isKindOfClass:[NSNull class]]){
		self.summary = dictionary[kHereNowSummary];
	}	
	return self;
}

@end