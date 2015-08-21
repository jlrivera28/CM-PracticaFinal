//
//  ViewController.m
//  PracticaFinal
//
//  Created by jlrivera on 8/20/15.
//  Copyright (c) 2015 jlrivera. All rights reserved.
//

#import "Start.h"
#import "CustomCell.h"
#import "Mapa.h"
#import "Declarations.h"
#import "Google/Analytics.h"


float myLatitude;
float myLongitude;


@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Welcome Screen"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController{
    maCountries = [[NSMutableArray alloc] initWithObjects:@"Mexico", @"Paris", @"Londres", @"Madrid", nil];
    latitude = [[NSMutableArray alloc] initWithObjects: [NSNumber numberWithFloat:19.39f], [NSNumber numberWithFloat:48.85f], [NSNumber numberWithFloat:51.52f], [NSNumber numberWithFloat:40.43f],  nil];
    longitude = [[NSMutableArray alloc] initWithObjects: [NSNumber numberWithFloat:-99.14f], [NSNumber numberWithFloat:2.34f], [NSNumber numberWithFloat:-0.10f], [NSNumber numberWithFloat:-3.67f],  nil];
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:@"CustomCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    }
    
    //Fill cell with info from arrays
    cell.countryLabel.text   = maCountries[indexPath.row];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    myIndex = (int)indexPath.row;
    Mapa *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Mapa"];
    [self presentViewController:viewController animated:YES completion:nil];

}



@end
