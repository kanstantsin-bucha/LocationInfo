//
//  QMLocationAnnotation.h
//  QromaScan
//
//  Created by bucha on 9/21/17.
//  Copyright © 2017 Qroma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "QMLocationInfo.h"


@interface QMLocationAnnotation : NSObject
<
MKAnnotation
>

@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString * title;

+ (instancetype) annotationUsing: (QMLocationInfo *) info;

@end
