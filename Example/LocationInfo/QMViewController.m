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
