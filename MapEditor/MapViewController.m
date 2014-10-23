//
//  MapViewController.m
//  MapEditor
//
//  Created by ビザンコムマック０９ on 2014/10/23.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "MapViewController.h"

#import "CustomAnnotation.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
	
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.mapView.delegate = self;
	
	self.mapView.showsUserLocation = YES;
	self.mapView.mapType = MKMapTypeHybrid;
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	
	CLLocationCoordinate2D location;
	location.latitude = 34.07511029;
	location.longitude = 134.556;//55709219;
	
	region.span = span;
	region.center = location;
	
	[self.mapView setRegion: region animated: YES];
	
	CustomAnnotation* tt = [[CustomAnnotation alloc] init];
	tt.coordinate = CLLocationCoordinate2DMake(34.074, 134.556);
	tt.title = @"Tokyo Tower";
	tt.subtitle = @"opening in Dec 1958";
	tt.sample = @"34.074, 134.556";
	
	// Tokyo Skytree
	CustomAnnotation* st = [[CustomAnnotation alloc] init];
	st.coordinate = CLLocationCoordinate2DMake(34.076, 134.557);
	st.title = @"Tokyo Skytree";
	st.subtitle = @"opening in May 2012";
	st.sample = @"34.076, 134.557";
	
	// add annotations to map
	[self.mapView addAnnotations: @[tt, st]];

}

- (void)didReceiveMemoryWarning
{
	
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
	
}

- (IBAction)button_TokusimaJyou_Action: (id)sender
{
	
	MKCoordinateRegion region;
	MKCoordinateSpan span;
	span.latitudeDelta = 0.005;
	span.longitudeDelta = 0.005;
	
	CLLocationCoordinate2D location;
	location.latitude = 34.07511029;
	location.longitude = 134.556;//55709219;
	
	region.span = span;
	region.center = location;
	
	[self.mapView setRegion: region animated: YES];
	
}

- (void)      mapView: (MKMapView *)mapView
didAddAnnotationViews: (NSArray *)views
{
	
	// add detail disclosure button to callout
	[views enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
		((MKAnnotationView*)obj).rightCalloutAccessoryView
		= [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	}];
	
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	// create right accessory view
	UILabel* sample = [[UILabel alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 32.f)];
	sample.backgroundColor = [UIColor clearColor];
	sample.font = [UIFont fontWithName:@"Helvetica" size: 13];
	sample.text = ((CustomAnnotation*)view.annotation).sample;
	sample.textColor = [UIColor whiteColor];
	
	// add view to callout
	view.rightCalloutAccessoryView = nil; // ??
	view.rightCalloutAccessoryView = sample;
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
	view.rightCalloutAccessoryView
	= [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView
		  viewForAnnotation:(id)annotation
{
	
	static NSString *PinIdentifier = @"Pin";
	
	MKAnnotationView *av = (MKAnnotationView*)
	[self.mapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
	
	if(av == nil){
		av = [[MKAnnotationView alloc]
			   initWithAnnotation:annotation reuseIdentifier:PinIdentifier];
		av.image = [UIImage imageNamed:@"maps.png"];  // アノテーションの画像を指定する
		av.canShowCallout = YES;  // ピンタップ時にコールアウトを表示する
	}
	
	return av;
	
}

@end
