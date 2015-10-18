//
//  LoginViewController.m
//  InstaScreen
//
//  Created by Jony Fu on 10/15/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "LoginViewController.h"
#import <ALView+PureLayout.h>


/**
 *  Instagram Profile
 */
#define client_id @"d3ee1cc36f1843af8ff9934f61341d74"
#define redirect_uri @"instascreen://auth/instascreen"
#define auth_url @"https://api.instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token"


@interface LoginViewController ()

@property (strong, nonatomic) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.867 green:0.902 blue:0.929 alpha:1.000]];
    [self createLoginButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  Create Login Button
 */

- (void)createLoginButton {
    _loginButton = [[UIButton alloc] initForAutoLayout];
    [_loginButton setTitle:@"Login with Instagram" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:0.196 green:0.357 blue:0.510 alpha:1.000]];
    [_loginButton setTintColor:[UIColor colorWithRed:0.867 green:0.902 blue:0.929 alpha:1.000]];
    [_loginButton.layer setCornerRadius:5.00];
    [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    
    // PureLayout
    [_loginButton autoSetDimension:ALDimensionHeight toSize:70];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:50];
}

- (void)login:(UIButton *)sender {
    NSString *url = [[NSString alloc] initWithFormat:auth_url, client_id, redirect_uri];
    if (! [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]) {
    
    }
}

@end
