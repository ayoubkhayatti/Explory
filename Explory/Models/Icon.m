//
//  Icon.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Icon.h"

NSString *const kIconPrefix = @"prefix";
NSString *const kIconSuffix = @"suffix";

@interface Icon ()
@end

@implementation Icon

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kIconPrefix] isKindOfClass:[NSNull class]]){
		self.prefix = dictionary[kIconPrefix];
	}	
	if(![dictionary[kIconSuffix] isKindOfClass:[NSNull class]]){
		self.suffix = dictionary[kIconSuffix];
	}	
	return self;
}

@end