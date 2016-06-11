//
//  ConnectionManager.h
//  Explory
//
//  Created by Ayoub Khayatti on 11/06/16.
//  Copyright © 2016 Ayoub Khayati. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionManager : NSObject

+ (ConnectionManager*)sharedManager;

+ (void)sendSearchRequest:(NSString*)text
                  success:(void(^)(NSArray *venues))onSuccess
                  failure:(void(^)(NSError*))onFailure;
@end
