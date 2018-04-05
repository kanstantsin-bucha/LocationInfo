//
//  QMLocationInfoLuongConvertion.m
//  QromaScan
//
//  Created by bucha on 9/6/17.
//  Copyright © 2017 Qroma. All rights reserved.
//

#import "QMLocationInfoStringConversion.h"

#define QMLocationInfoStringDelimiter @","

@implementation QMLocationInfoStringConversion

//MARK: - interface -

+ (QMLocationInfo * _Nullable) locationInfoUsingString: (NSString * _Nullable) string {
    
    if ( string == nil ) {
        
        return nil;
    }
    
    NSArray * strings = [string componentsSeparatedByString: QMLocationInfoStringDelimiter];
    
    if (strings.count != 8) {
        
        return nil;
    }
    
    NSString * sublocation = [(NSString *)strings[0] length] != 0 ? strings[0] : nil;
    NSString * city = [(NSString *)strings[1] length] != 0 ? strings[1] : nil;
    NSString * state = [(NSString *)strings[2] length] != 0 ? strings[2] : nil;
    NSString * country = [(NSString *)strings[3] length] != 0 ? strings[3] : nil;
    NSString * postalCode = [(NSString *)strings[4] length] != 0 ? strings[4] : nil;
    NSString * countryCode = [(NSString *)strings[5] length] != 0 ? strings[5] : nil;
    NSString * latitude = [(NSString *)strings[6] length] != 0 ? strings[6] : nil;
    NSString * longitude = [(NSString *)strings[7] length] != 0 ? strings[7] : nil;
    
    double latitudeValue = latitude.doubleValue;
    double longitudeValue = longitude.doubleValue;
    
    QMLocation * location = [QMLocation locationUsingLatitude: latitudeValue
                                                    longitude: longitudeValue
                                                    timestamp: nil];
    
    QMLocationInfo * result = [QMLocationInfo locationInfoUsingSublocation: sublocation
                                                                      city: city
                                                                     state: state
                                                                postalCode: postalCode
                                                                   country: country
                                                               countryCode: countryCode
                                                                  location: location];
    
    return result;
}

+ (NSString * _Nonnull) srtingRepresentationUsingLocationInfo: (QMLocationInfo * _Nonnull) info {
    
    NSArray * strings = @[
                           info.sublocation != nil ? info.sublocation : @"",
                           info.city != nil ? info.city : @"",
                           info.state != nil ? info.state : @"",
                           info.country != nil ? info.country : @"",
                           info.postalCode != nil ? info.postalCode : @"",
                           info.countryCode != nil ? info.countryCode : @"",
                           info.location.latitude != 0 ? [NSString stringWithFormat: @"%f", info.location.latitude] : @"",
                           info.location.longitude != 0 ? [NSString stringWithFormat: @"%f", info.location.longitude] : @""
                        ];
    
    NSString * result = [strings componentsJoinedByString: QMLocationInfoStringDelimiter];
    return result;
}

@end
