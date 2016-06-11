//
//  Location.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Location.h"

NSString *const kLocationAddress = @"address";
NSString *const kLocationCc = @"cc";
NSString *const kLocationCity = @"city";
NSString *const kLocationCountry = @"country";
NSString *const kLocationCrossStreet = @"crossStreet";
NSString *const kLocationDistance = @"distance";
NSString *const kLocationFormattedAddress = @"formattedAddress";
NSString *const kLocationLat = @"lat";
NSString *const kLocationLng = @"lng";
NSString *const kLocationPostalCode = @"postalCode";
NSString *const kLocationState = @"state";

@interface Location ()
@end

@implementation Location

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLocationAddress] isKindOfClass:[NSNull class]]){
		self.address = dictionary[kLocationAddress];
	}	
	if(![dictionary[kLocationCc] isKindOfClass:[NSNull class]]){
		self.cc = dictionary[kLocationCc];
	}	
	if(![dictionary[kLocationCity] isKindOfClass:[NSNull class]]){
		self.city = dictionary[kLocationCity];
	}	
	if(![dictionary[kLocationCountry] isKindOfClass:[NSNull class]]){
		self.country = dictionary[kLocationCountry];
	}	
	if(![dictionary[kLocationCrossStreet] isKindOfClass:[NSNull class]]){
		self.crossStreet = dictionary[kLocationCrossStreet];
	}	
	if(![dictionary[kLocationDistance] isKindOfClass:[NSNull class]]){
		self.distance = [dictionary[kLocationDistance] integerValue];
	}

	if(![dictionary[kLocationFormattedAddress] isKindOfClass:[NSNull class]]){
		self.formattedAddress = dictionary[kLocationFormattedAddress];
	}	
	if(![dictionary[kLocationLat] isKindOfClass:[NSNull class]]){
		self.lat = [dictionary[kLocationLat] floatValue];
	}

	if(![dictionary[kLocationLng] isKindOfClass:[NSNull class]]){
		self.lng = [dictionary[kLocationLng] floatValue];
	}

	if(![dictionary[kLocationPostalCode] isKindOfClass:[NSNull class]]){
		self.postalCode = dictionary[kLocationPostalCode];
	}	
	if(![dictionary[kLocationState] isKindOfClass:[NSNull class]]){
		self.state = dictionary[kLocationState];
	}	
	return self;
}

@end