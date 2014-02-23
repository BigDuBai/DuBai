//
//  HomeViewController.h
//  DuBai
//
//  Created by darktm on 14-2-23.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseScrollView.h"

@interface HomeViewController : BaseViewController
@property (weak, nonatomic) IBOutlet BaseScrollView *srv;
- (IBAction)on_btn_login:(id)sender;

@end
