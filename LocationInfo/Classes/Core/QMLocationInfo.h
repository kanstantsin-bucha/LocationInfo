//
//  QMLocationInfo.h
//  QromaScan
//
//  Created by Bucha Kanstantsin on 5/30/16.
//  Copyright © 2016 Qroma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMLocation.h"


@interface QMLocationInfo : NSObject

// implemented in accordance with ITCP geographic fields description
// https://www.iptc.org/std/photometadata/documentation/GenericGuidelines/index.htm#!Documents/iptccoreimagesection.htm

@property (copy, nonatomic, readonly) NSString * sublocation;
@property (copy, nonatomic, readonly) NSString * city;
@property (copy, nonatomic, readonly) NSString * state;
@property (copy, nonatomic, readonly) NSString * country;
@property (copy, nonatomic, readonly) NSString * countryCode;
@property (strong, nonatomic, readonly) QMLocation * location;

@property (copy, nonatomic, readonly) NSString * address;

+ (instancetype)locationInfoUsingLocation:(QMLocation *)location;
+ (instancetype)locationInfoUsingSublocation:(NSString *)sublocation
                                        city:(NSString *)city
                                       state:(NSString *)state
                                     country:(NSString *)country
                                 countryCode:(NSString *)countryCode
                                    location:(QMLocation *)location;
                                    
- (BOOL)isSpecificPlaceOfLocation:(QMLocationInfo *)location;

@end


