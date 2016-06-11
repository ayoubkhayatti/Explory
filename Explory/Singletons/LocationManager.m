//
//  LocationManager.m
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import "LocationManager.h"
#import <UIKit/UIKit.h>

NSString* const kLocationMangerPermissionDidChange = @"kLocationMangerPermissionDidChange";

@interface LocationManager ()
@property (nonatomic) CLLocationManager *coreLocationManager;
@end

@implementation LocationManager

+ (LocationManager*)sharedManager {
    static LocationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[LocationManager alloc] init];
        
    });
    return sharedManager;
}

+ (LocationManager*)initializeLocationManager{
    LocationManager *instance = [LocationManager sharedManager];
    
    instance.coreLocationManager = [[CLLocationManager alloc] init];
    instance.coreLocationManager.delegate = instance;
    
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
        [instance.coreLocationManager requestWhenInUseAuthorization];
    }
    
    instance.coreLocationManager.desiredAccuracy    = kCLLocationAccuracyNearestTenMeters;
    instance.coreLocationManager.distanceFilter     = 100;
    instance.coreLocationManager.headingFilter      = 90;
    instance.coreLocationManager.activityType       = CLActivityTypeFitness;
    instance.coreLocationManager.pausesLocationUpdatesAutomatically = true;
    
    [instance locationManagerAuthorizationStatus];
    
    return instance;
}

- (void)locationManagerAuthorizationStatus
{
    NSLog(@"Location service enabled = %d", [CLLocationManager locationServicesEnabled]);

    switch (CLLocationManager.authorizationStatus) {
        case kCLAuthorizationStatusDenied:
            NSLog(@"Location authorizationStatus denied");
            [self handleDeniedAuthorization];
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"Location authorizationStatus when in use");
            break;
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"Location authorizationStatus not determined");
            break;
        default:
            NSLog(@"Location services authorizationStatus %d",CLLocationManager.authorizationStatus);
            break;
    }
}

- (void)handleDeniedAuthorization
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Location Service"
                                                                             message:@"In order to find relevant and nearby venues, please open this app's settings and set location access to 'When Using the App'."
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alertController addAction:cancelAction];
    
    UIAlertAction *openSettings = [UIAlertAction actionWithTitle:@"Settings"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             NSURL *settings = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                                                             [[UIApplication sharedApplication]openURL:settings];
                                                         }];
    [alertController addAction:openSettings];
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    [rootViewController presentViewController:alertController animated:true completion:nil];
}

#pragma mark - Location updates

+ (void)startUpdatingLocation {
    if (CLLocationManager.locationServicesEnabled) {
        CLLocationManager *manager = [LocationManager sharedManager].coreLocationManager;
        [manager startUpdatingLocation];
    }
}

+ (void)stopUpdatingLocation {
    if (CLLocationManager.locationServicesEnabled) {
        CLLocationManager *manager = [LocationManager sharedManager].coreLocationManager;
        [manager stopUpdatingLocation];
    }
}

#pragma mark - Location permissions

+ (BOOL)isLocationServicesEnabledAndAllowedToBeUsed{
    BOOL locationServicesStatus = [CLLocationManager locationServicesEnabled];
    CLAuthorizationStatus authorizationStatus = [CLLocationManager authorizationStatus];
    
    return (locationServicesStatus && (authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse));
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    [[NSNotificationCenter defaultCenter]postNotificationName:kLocationMangerPermissionDidChange
                                                       object:@(status)];
    NSLog(@"LocationManager: didChangeAuthorizationStatus %d",status);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    LocationManager *instance = [LocationManager sharedManager];
    CLLocation *location = (CLLocation*)[locations lastObject];
    instance.currentLocation = location.coordinate;
    NSLog(@"LocationManager: didUpdateLocations %@",location);
}

@end
