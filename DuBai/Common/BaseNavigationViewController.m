//
//  BaseNavigationViewController.m
//  DuBai
//
//  Created by darktm on 14-2-20.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_7_0
- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
#endif

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
