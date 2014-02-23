//
//  HomeViewController.m
//  DuBai
//
//  Created by darktm on 14-2-23.
//  Copyright (c) 2014年 darktm. All rights reserved.
//

#import "HomeViewController.h"

#import "TaskWithLogin.h"

@interface HomeViewController ()<WYHttpTaskDelegate>

@end

@implementation HomeViewController

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
    
    
    UISearchBar *search = [[UISearchBar alloc] init];
    search.placeholder = @"ssdjlksdfjldsf";
    self.navigationItem.titleView = search;
    
    self.srv.frame = CGRectMake(0, 0, 320, 100);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestCompleteWithObj:(WYHttpTask *)obj{
    id rsult = [obj parese];
}
-(void)requestFailWithMsg:(WYHttpTask *)obj{
    DLog(@"");
}


- (IBAction)on_btn_login:(id)sender {
    TaskWithLogin *login = [[TaskWithLogin alloc] initWithName:@"qiaquancom" withPwd:@"123456"];
    login.delegate = self;
    [login start];
}
@end
