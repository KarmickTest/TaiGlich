//
//  SplashScreenViewController.m
//  Taiglich
//
//  Created by SAYAN MAC MINI on 1/31/17.
//  Copyright © 2017 Karmick. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "HomeViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

#pragma mark View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(nextpageMethod) withObject:nil afterDelay:1.5];
    
}

#pragma mark Self methods

-(void)nextpageMethod
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController* controller = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
