//
//  LocationManager.h
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic) CLLocationCoordinate2D currentLocation;

+ (LocationManager*)sharedManager;
+ (LocationManager*)initializeLocationManager;
+ (BOOL)isLocationServicesEnabledAndAllowedToBeUsed;

+ (void)startUpdatingLocation;
+ (void)stopUpdatingLocation;

@end
