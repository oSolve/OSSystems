//
//  OSViewController.m
//  OSSystems
//
//  Created by TC94615 on 04/15/2016.
//  Copyright (c) 2016 TC94615. All rights reserved.
//

#import <OSSystems/OSSystems.h>
#import "OSViewController.h"

@interface OSViewController ()

@end

@implementation OSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@">>>>>>>>>>>> [OSSystems isMinimumiOS10] = %d", [OSSystems isMinimumiOS10]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
