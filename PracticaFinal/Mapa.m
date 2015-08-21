//
//  Mapa.m
//  PracticaFinal
//
//  Created by jlrivera on 8/20/15.
//  Copyright (c) 2015 jlrivera. All rights reserved.
//

#import "Mapa.h"
@import GoogleMaps;
#import "Declarations.h"

@interface Mapa ()

@end

@implementation Mapa{
    GMSMapView *mapView_;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    float mmmLat = [latitude[myIndex] floatValue];
    float mmmLon = [longitude[myIndex] floatValue];
    NSString *nsCountry = maCountries[myIndex];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:mmmLat
                                                            longitude:mmmLon
                                                                 zoom:6];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    mapView_.frame  = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-100);
    //self.view = mapView_;
    
    [mapView_ removeFromSuperview];
    [self.view addSubview:mapView_];
    
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(mmmLat , mmmLon);
    marker.title = nsCountry;
    marker.snippet = nsCountry;
    marker.map = mapView_;
    
    //[self.view sendSubviewToBack:mapView_];
    [self.view bringSubviewToFront:mapView_];
    [self.view bringSubviewToFront:self.backBtn];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)paintMap{


}

- (IBAction)backPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
