//
//  CustomAnnotation.h
//  MapEditor
//
//  Created by ビザンコムマック０９ on 2014/10/23.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject < MKAnnotation >

@property (readwrite, nonatomic) CLLocationCoordinate2D coordinate; // required
@property (readwrite, nonatomic, strong) NSString* title; // optional
@property (readwrite, nonatomic, strong) NSString* subtitle; // ditto
@property (readwrite, nonatomic, strong) NSString* sample; // for example

@end
