//
//  QMLocationInfoLuongConvertion.m
//  QromaScan
//
//  Created by bucha on 9/6/17.
//  Copyright © 2017 Qroma. All rights reserved.
//

#import "QMLocationInfoLuongConvertion.h"
#import "QMLocationInfoAppleConvertion.h"

@implementation QMLocationInfoLuongConvertion

//MARK: - interface -

+ (QMLocationInfo *) locationInfoUsingAddress: (LMAddress *) address {

    if (address == nil) {
        return nil;
    }
    
    if ([address.rawSource isKindOfClass: [CLPlacemark class]]) {
        QMLocationInfo * result =
            [QMLocationInfoAppleConvertion locationInfoUsingPlacemark:(CLPlacemark *) address.rawSource];
        return result;
    }
    
//    NSLog(@"Address: streetNumber: %@, route: %@, neighborhood: %@, city: %@, subLocality: %@, locality: %@, subAdministrativeArea: %@, administrativeArea: %@, country: %@",
//                     address.streetNumber, address.route, address.neighborhood, address.postalTown, address.subLocality, address.locality, address.subAdministrativeArea, address.administrativeArea, address.country );
    CLLocationCoordinate2D coordinate = address.coordinate;
    QMLocation * location = [QMLocation locationUsingLatitude: coordinate.latitude
                                                    longitude: coordinate.longitude
                                                    timestamp: [NSDate date]];
    NSString * route = address.streetNumber;
    if (address.route.length > 0) {
        route = [route stringByAppendingFormat: @" %@", address.route];
    }
    
    NSString * sublocation = route != nil ? route
                                          : address.subLocality;

    NSString * city = address.postalTown != nil ? address.postalTown
                                                : address.locality;
    NSString * state = address.administrativeArea;
   
    QMLocationInfo * result = [QMLocationInfo locationInfoUsingSublocation: sublocation
                                                                      city: city
                                                                     state: state
                                                                   country: address.country
                                                               countryCode: address.ISOcountryCode
                                                                  location: location];
    return result;
}

@end
