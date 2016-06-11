//
//  Category.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Category.h"

NSString *const kCategoryIcon = @"icon";
NSString *const kCategoryIdField = @"id";
NSString *const kCategoryName = @"name";
NSString *const kCategoryPluralName = @"pluralName";
NSString *const kCategoryPrimary = @"primary";
NSString *const kCategoryShortName = @"shortName";

@interface Category ()
@end

@implementation Category

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kCategoryIcon] isKindOfClass:[NSNull class]]){
		self.icon = [[Icon alloc] initWithDictionary:dictionary[kCategoryIcon]];
	}

	if(![dictionary[kCategoryIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kCategoryIdField];
	}	
	if(![dictionary[kCategoryName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kCategoryName];
	}	
	if(![dictionary[kCategoryPluralName] isKindOfClass:[NSNull class]]){
		self.pluralName = dictionary[kCategoryPluralName];
	}	
	if(![dictionary[kCategoryPrimary] isKindOfClass:[NSNull class]]){
		self.primary = [dictionary[kCategoryPrimary] boolValue];
	}

	if(![dictionary[kCategoryShortName] isKindOfClass:[NSNull class]]){
		self.shortName = dictionary[kCategoryShortName];
	}	
	return self;
}

@end