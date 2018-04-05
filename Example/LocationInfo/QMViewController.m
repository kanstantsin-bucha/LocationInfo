//
//  QMViewController.m
//  LocationInfo
//
//  Created by truebucha on 01/28/2018.
//  Copyright (c) 2018 truebucha. All rights reserved.
//

#import "QMViewController.h"
#import <LocationInfo/LocationInfo.h>
#import <LMGeocoderUniversal/LMGeocoderUniversal.h>

@interface QMViewController ()

@end


@implementation QMViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    QMLocation * location = [QMLocation locationUsingLatitude: 40
                                                    longitude: 150
                                                    timestamp: nil];
    QMLocationInfo * info = [QMLocationInfo locationInfoUsingSublocation: @""
                                                                    city: @""
                                                                   state: @""
                                                                 country: @""
                                                             countryCode: @""
                                                                location: location];
    QMLocationAnnotation * annotation = [QMLocationAnnotation annotationUsing: info];
    
    NSLog(@"converted from string format 1: latitude(signed double), longitude(signed double)");
    NSLog(@"converted back: %@", [QMLocationInfoStringConversion locationInfoUsingString: @"37.870255,-122.259487"]);
    
    NSLog(@"converted from string format 2: latitude(signed double), longitude(signed double), city, state, country ");
    NSLog(@"converted back: %@", [QMLocationInfoStringConversion locationInfoUsingString: @"37.870255,-122.259487,Berkeley,California,United States"]);
    
    NSLog(@"converted from string format 3: latitude(signed double), longitude(signed double), sublocation, city, state, postalCode, country, countryCode");
    NSLog(@"converted back: %@", [QMLocationInfoStringConversion locationInfoUsingString: @"37.870255,-122.259487,Sather Road,Berkeley,California,94720, United States,US"]);
    
    [[LMGeocoder geocoder] geocodeAddressString: @"Sather Gate"
                                        service: kLMGeocoderGoogleService
                              completionHandler: ^(NSArray<LMAddress *> * _Nullable results, NSError * _Nullable error) {
                                  
        QMLocationInfo * info = [QMLocationInfoLuongConvertion locationInfoUsingAddress: results.firstObject];
        NSLog(@"google %@", info);
                                
        NSString * conversion =  [QMLocationInfoStringConversion srtingRepresentationUsingLocationInfo: info];
        NSLog(@"conversion : %@", conversion);
        NSLog(@"converted back: %@", [QMLocationInfoStringConversion locationInfoUsingString: conversion]);
    }];
    
    [[CLGeocoder new] geocodeAddressString: @"Sather Gate"
                         completionHandler: ^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
                                 
        QMLocationInfo * info = [QMLocationInfoAppleConvertion locationInfoUsingPlacemark: placemarks.firstObject];
        NSLog(@"apple %@", info);
    }];
}

@end
