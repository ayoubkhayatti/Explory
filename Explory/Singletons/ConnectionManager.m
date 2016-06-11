//
//  ConnectionManager.m
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ConnectionManager.h"
#import "LocationManager.h"
#import "Venue.h"

NSString *const kFoursquareClientId = @"-";
NSString *const kFoursquareSecret   = @"-";
NSString *const kFoursquareVersion  = @"20160610";

NSString *const kRESTGET    = @"GET";
NSString *const kRESTPOST   = @"POST";

NSString *const kEndPointSearch = @"https://api.foursquare.com/v2/venues/search";

@interface ConnectionManager()

@property (nonatomic) NSSet *acceptableContentTypes;
@property (nonatomic) NSString *requestContentType;
@property (nonatomic) AFHTTPRequestSerializer *requestSerializer;
@property (nonatomic) AFHTTPResponseSerializer *responseSerializer;

@end

@implementation ConnectionManager

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

+ (ConnectionManager*)sharedManager {
    static ConnectionManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ConnectionManager alloc] init];
    });
    return sharedManager;
}

- (void)setup {
    self.acceptableContentTypes = [[NSSet alloc]initWithObjects:@"text/plain",@"text/html",@"application/json",nil];
    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.requestSerializer  = [AFJSONRequestSerializer serializer];
}


+ (void)sendSearchRequest:(NSString*)text
                  success:(void(^)(NSArray *venues))onSuccess
                  failure:(void(^)(NSError*))onFailure
{
    // Create manager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer   = [[ConnectionManager sharedManager]requestSerializer];
    manager.responseSerializer  = [[ConnectionManager sharedManager]responseSerializer];
    CLLocationCoordinate2D location = [[LocationManager sharedManager]currentLocation];
    
    if (location.longitude != 0) {
     
        NSString *coordinates = [NSString stringWithFormat:@"%f, %f",location.latitude, location.longitude];
        
        // Create request
        NSDictionary* URLParameters = @{
                                        @"client_id":kFoursquareClientId,
                                        @"client_secret":kFoursquareSecret,
                                        @"ll":coordinates,
                                        @"v":kFoursquareVersion,
                                        @"query":text,
                                        };
        
        [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:true];
        
        [manager GET:kEndPointSearch parameters:URLParameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:false];
            NSArray *venues = [Venue parseSearchResponse:responseObject];
            onSuccess(venues);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:false];
            onFailure(error);
        }];
        
    }
}

@end
