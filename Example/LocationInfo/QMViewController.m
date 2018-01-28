//
//  QMViewController.m
//  LocationInfo
//
//  Created by truebucha on 01/28/2018.
//  Copyright (c) 2018 truebucha. All rights reserved.
//

#import "QMViewController.h"
#import <LocationInfo/LocationInfo.h>
#import <LocationInfo/QMLocationInfoAppleConvertion.h>
#import <LocationInfo/QMLocationInfoLuongConvertion.h>
#import <LocationInfo/QMLocationAnnotation.h>

@interface QMViewController ()

@end

@implementation QMViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    QMLocationInfo * info = [QMLocationInfo locationInfoUsingSublocation: @""
                                                                    city: @""
                                                                   state: @""
                                                                 country: @""
                                                             countryCode: @""
                                                                location: nil];
    
    [QMLocationInfoAppleConvertion locationInfoUsingPlacemark: [CLPlacemark new]];
    [QMLocationInfoLuongConvertion locationInfoUsingAddress: [LMAddress new]];
    [QMLocationAnnotation annotationUsing: info];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
