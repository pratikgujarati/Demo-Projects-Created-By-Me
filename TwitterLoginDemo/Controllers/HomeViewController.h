//
//  HomeViewController.h
//  TwitterLoginDemo
//
//  Created by Infusion on 6/13/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwitterKit/TwitterKit.h>

@interface HomeViewController : UIViewController

@property(nonatomic,retain) IBOutlet UIButton *btnLoginWithTwitter;
@property(nonatomic,retain) IBOutlet UIButton *btnLogoutFromTwitter;

@end
