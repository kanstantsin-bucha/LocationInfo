//
//  QMLocation.h
//  QromaScan
//
//  Created by Bucha Kanstantsin on 5/30/16.
//  Copyright © 2016 Qroma. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QMLocation : NSObject

@property (assign, nonatomic) double latitude;
@property (assign, nonatomic) double longitude;
@property (strong, nonatomic) NSDate * timestamp;

+ (instancetype)locationUsingLatitude:(double)latitude
                            longitude:(double)longitude
                            timestamp:(NSDate *)timestamp;

@end

