//
//  QMLocationInfoAppleConvertion.h
//  QromaScan
//
//  Created by bucha on 9/6/17.
//  Copyright © 2017 Qroma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "QMLocationInfo.h"


@interface QMLocationInfoAppleConvertion : NSObject

+ (QMLocationInfo *) locationInfoUsingPlacemark: (CLPlacemark *) placemark;
+ (CLLocation *) clLocationUsing: (QMLocation *) location;

@end

