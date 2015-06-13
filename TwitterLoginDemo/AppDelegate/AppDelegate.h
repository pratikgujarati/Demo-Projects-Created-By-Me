//
//  AppDelegate.h
//  TwitterLoginDemo
//
//  Created by Infusion on 6/13/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwitterKit/TwitterKit.h>
#import <Fabric/Fabric.h>
#import <Twitter/Twitter.h>

#import "HomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *homeVC;
@property (strong, nonatomic) UINavigationController *navC;

@end

