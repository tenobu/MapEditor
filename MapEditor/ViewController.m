//
//  ViewController.m
//  MapEditor
//
//  Created by ビザンコムマック０９ on 2014/10/23.
//  Copyright (c) 2014年 ビザンコムマック０９. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{

	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	self.mapView.delegate = self;
	
}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.

}

- (IBAction)button_TokusimaJyou_Action: (id)sender
{

//	CLLocationCoordinate2D centerCoord = { 34.07511029, 134.55709219 };
	CLLocationCoordinate2D centerCoord = { 34.071304, 134.595471 };
	
	[self.mapView setCenterCoordinate: centerCoord];

}

@end
