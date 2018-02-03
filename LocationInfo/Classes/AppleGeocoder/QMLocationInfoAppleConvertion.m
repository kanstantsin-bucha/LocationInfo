//
//  QMLocationInfoAppleConvertion.m
//  QromaScan
//
//  Created by bucha on 9/6/17.
//  Copyright © 2017 Qroma. All rights reserved.
//

#import "QMLocationInfoAppleConvertion.h"


@interface QMLocationInfoAppleConvertion ()

@property (strong, nonatomic, class, readonly) NSDictionary * statesByShortcut;

@end


@implementation QMLocationInfoAppleConvertion

//MARK: - property -

+ (NSDictionary *)statesByShortcut {
    NSDictionary * result = @{
          @"AL": @"Alabama",
          @"AK": @"Alaska",
          @"AS": @"American Samoa",
          @"AZ": @"Arizona",
          @"AR": @"Arkansas",
          @"CA": @"California",
          @"CO": @"Colorado",
          @"CT": @"Connecticut",
          @"DE": @"Delaware",
          @"DC": @"District Of Columbia",
          @"FM": @"Federated States Of Micronesia",
          @"FL": @"Florida",
          @"GA": @"Georgia",
          @"GU": @"Guam",
          @"HI": @"Hawaii",
          @"ID": @"Idaho",
          @"IL": @"Illinois",
          @"IN": @"Indiana",
          @"IA": @"Iowa",
          @"KS": @"Kansas",
          @"KY": @"Kentucky",
          @"LA": @"Louisiana",
          @"ME": @"Maine",
          @"MH": @"Marshall Islands",
          @"MD": @"Maryland",
          @"MA": @"Massachusetts",
          @"MI": @"Michigan",
          @"MN": @"Minnesota",
          @"MS": @"Mississippi",
          @"MO": @"Missouri",
          @"MT": @"Montana",
          @"NE": @"Nebraska",
          @"NV": @"Nevada",
          @"NH": @"New Hampshire",
          @"NJ": @"New Jersey",
          @"NM": @"New Mexico",
          @"NY": @"New York",
          @"NC": @"North Carolina",
          @"ND": @"North Dakota",
          @"MP": @"Northern Mariana Islands",
          @"OH": @"Ohio",
          @"OK": @"Oklahoma",
          @"OR": @"Oregon",
          @"PW": @"Palau",
          @"PA": @"Pennsylvania",
          @"PR": @"Puerto Rico",
          @"RI": @"Rhode Island",
          @"SC": @"South Carolina",
          @"SD": @"South Dakota",
          @"TN": @"Tennessee",
          @"TX": @"Texas",
          @"UT": @"Utah",
          @"VT": @"Vermont",
          @"VI": @"Virgin Islands",
          @"VA": @"Virginia",
          @"WA": @"Washington",
          @"WV": @"West Virginia",
          @"WI": @"Wisconsin",
          @"WY": @"Wyoming",
    };
    return result;
}

//MARK: - interface -

+ (CLLocation *) clLocationUsing: (QMLocation *) location {
    if (location == nil) {
        return nil;
    }
    CLLocation * result = [[CLLocation alloc] initWithLatitude: location.latitude
                                                     longitude: location.longitude];
    
    return result;
}

+ (QMLocationInfo *) locationInfoUsingPlacemark: (CLPlacemark *) placemark {
    if (placemark == nil
        || !placemark.location) {
        return nil;
    }
    
    CLLocationCoordinate2D coordinate = placemark.location.coordinate;
    QMLocation * location = [QMLocation locationUsingLatitude: coordinate.latitude
                                                    longitude: coordinate.longitude
                                                    timestamp: placemark.location.timestamp];
    
    NSString * sublocation = [self sublocationUsingAddressDictionary: placemark.addressDictionary];
    NSString * city = placemark.addressDictionary[@"City"];
    NSString * state = [self stateUsingAddressDictionary: placemark.addressDictionary];
   
    QMLocationInfo * result = [QMLocationInfo locationInfoUsingSublocation: sublocation
                                                                      city: city
                                                                     state: state
                                                                   country: placemark.country
                                                               countryCode: placemark.ISOcountryCode
                                                                  location: location];
    return result;
}

//MARK: - logic -

+ (NSString *)stateUsingAddressDictionary:(NSDictionary *)address {
    NSString * stateToProcess = address[@"State"];
    
    NSString * result = nil;
    if (stateToProcess.length > 0) {
        NSString * USState = [[self class] statesByShortcut][stateToProcess];
        if (USState.length > 0) {
            result = USState;
        } else {
            result = stateToProcess;
        }
    }
    return result;
}

+ (NSString *)sublocationUsingAddressDictionary:(NSDictionary *)address {

    NSString * result = address[@"Name"];
    
    // for coutry location [aka name] is equal to country name
    // so we ommit it to not frustrate users and geocoder
    NSString * country = address[@"Country"];
    if (country.length > 0
        && [result isEqualToString:country]) {
        result = nil;
    }
    
    // for city location sublocation [aka name] is equal to city and state name
    // so we ommit it to not frustrate users and geocoder
    NSString * city = address[@"City"];
    if (city.length > 0
        && [result containsString:city]) {
        result = nil;
    }
    
    // for state location sublocation [aka name] is equal to state name
    // so we ommit it to not frustrate users and geocoder
    NSString * state = [self stateUsingAddressDictionary:address];
    if (state.length > 0
        && [result isEqualToString:state]) {
        result = nil;
    }
    
    if (city.length > 0
        && [result containsString:city]) {
        result = nil;
    }
    
    if (result.length == 0) {
        result = address[@"SubLocality"];
    }
    
    if (result.length == 0) {
        result = address[@"Thoroughfare"];
    }
    
    return result;
}

@end
