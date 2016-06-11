//
//  Venue.m
//  Explory
//
//  Created by Ayoub Khayatti on 10/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "Venue.h"

NSString *const kVenueClassCategories = @"categories";
NSString *const kVenueClassContact = @"contact";
NSString *const kVenueClassHereNow = @"hereNow";
NSString *const kVenueClassIdField = @"id";
NSString *const kVenueClassLocation = @"location";
NSString *const kVenueClassName = @"name";
NSString *const kVenueClassReferralId = @"referralId";
NSString *const kVenueClassSpecials = @"specials";
NSString *const kVenueClassStats = @"stats";
NSString *const kVenueClassUrl = @"url";
NSString *const kVenueClassVenueChains = @"venueChains";
NSString *const kVenueClassVerified = @"verified";

@interface Venue ()
@end

@implementation Venue

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kVenueClassCategories] != nil && [dictionary[kVenueClassCategories] isKindOfClass:[NSArray class]]){
		NSArray * categoriesDictionaries = dictionary[kVenueClassCategories];
		NSMutableArray * categoriesItems = [NSMutableArray array];
		for(NSDictionary * categoriesDictionary in categoriesDictionaries){
			Category * categoriesItem = [[Category alloc] initWithDictionary:categoriesDictionary];
			[categoriesItems addObject:categoriesItem];
		}
		self.categories = categoriesItems;
	}
	if(![dictionary[kVenueClassContact] isKindOfClass:[NSNull class]]){
		self.contact = [[Contact alloc] initWithDictionary:dictionary[kVenueClassContact]];
	}

	if(![dictionary[kVenueClassHereNow] isKindOfClass:[NSNull class]]){
		self.hereNow = [[HereNow alloc] initWithDictionary:dictionary[kVenueClassHereNow]];
	}

	if(![dictionary[kVenueClassIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kVenueClassIdField];
	}	
	if(![dictionary[kVenueClassLocation] isKindOfClass:[NSNull class]]){
		self.location = [[Location alloc] initWithDictionary:dictionary[kVenueClassLocation]];
	}

	if(![dictionary[kVenueClassName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kVenueClassName];
	}	
	if(![dictionary[kVenueClassReferralId] isKindOfClass:[NSNull class]]){
		self.referralId = dictionary[kVenueClassReferralId];
	}	
	if(![dictionary[kVenueClassSpecials] isKindOfClass:[NSNull class]]){
		self.specials = [[Special alloc] initWithDictionary:dictionary[kVenueClassSpecials]];
	}

	if(![dictionary[kVenueClassStats] isKindOfClass:[NSNull class]]){
		self.stats = [[Stat alloc] initWithDictionary:dictionary[kVenueClassStats]];
	}

	if(![dictionary[kVenueClassUrl] isKindOfClass:[NSNull class]]){
		self.url = dictionary[kVenueClassUrl];
	}	
	if(![dictionary[kVenueClassVenueChains] isKindOfClass:[NSNull class]]){
		self.venueChains = dictionary[kVenueClassVenueChains];
	}	
	if(![dictionary[kVenueClassVerified] isKindOfClass:[NSNull class]]){
		self.verified = [dictionary[kVenueClassVerified] boolValue];
	}

	return self;
}

+ (NSArray*)parseSearchResponse:(id)response
{
    if (response && [response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *json = (NSDictionary*)response;
        id venues = json[@"response"][@"venues"];
        
        if (venues && [venues isKindOfClass:[NSArray class]]) {
            NSArray *array = (NSArray*)venues;
            NSMutableArray *results = [NSMutableArray new];
            
            for (NSDictionary* venue in array) {
                Venue *parsedVenue = [[Venue alloc]initWithDictionary:venue];
                [results addObject:parsedVenue];
            }
            
            return [results copy];
        }
    }

    return [NSArray new];
}

@end
