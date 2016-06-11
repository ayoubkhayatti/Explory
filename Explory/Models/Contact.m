//
//  Contact.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Contact.h"

NSString *const kContactFormattedPhone = @"formattedPhone";
NSString *const kContactPhone = @"phone";

@interface Contact ()
@end

@implementation Contact

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kContactFormattedPhone] isKindOfClass:[NSNull class]]){
		self.formattedPhone = dictionary[kContactFormattedPhone];
	}	
	if(![dictionary[kContactPhone] isKindOfClass:[NSNull class]]){
		self.phone = dictionary[kContactPhone];
	}	
	return self;
}

@end