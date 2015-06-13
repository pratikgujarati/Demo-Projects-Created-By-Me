//
//  HomeViewController.m
//  TwitterLoginDemo
//
//  Created by Infusion on 6/13/15.
//  Copyright (c) 2015 Infusion. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize btnLoginWithTwitter;
@synthesize btnLogoutFromTwitter;

#pragma mark - View Controller Delegate Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setInitialView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:YES
                                            withAnimation:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup Notification Methods

-(void)setupNotificationEvent
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(twitterDataLoadedEvent) name:@"twitterDataLoadedEvent" object:nil];
}

-(void)twitterDataLoadedEvent
{
}

#pragma mark - Setting Initial Views Methods

-(void)setInitialView
{
    
    //===== DEFAULT TWIITER LOGIN BUTTON =====//
//    TWTRLogInButton* logInButton =  [TWTRLogInButton
//                                     buttonWithLogInCompletion:
//                                     ^(TWTRSession* session, NSError* error) {
//                                         if (session) {
//                                             NSLog(@"signed in as %@", [session userName]);
//                                             
//                                             if ([[Twitter sharedInstance] session]) {
//                                                 TWTRShareEmailViewController* shareEmailViewController =
//                                                 [[TWTRShareEmailViewController alloc]
//                                                  initWithCompletion:^(NSString* email, NSError* error) {
//                                                      NSLog(@"Email : %@, Error: %@", email, error);
//                                                  }];
//                                                 [self presentViewController:shareEmailViewController
//                                                                    animated:YES
//                                                                  completion:nil];
//                                             } else {
//                                                 // TODO: Handle user not signed in (e.g.
//                                                 // attempt to log in or show an alert)
//                                             }
//
//                                         } else {
//                                             NSLog(@"error: %@", [error localizedDescription]);
//                                         }
//                                     }];
//    logInButton.center = self.view.center;
//    [self.view addSubview:logInButton];
    
    [btnLoginWithTwitter addTarget:self action:@selector(btnLoginWithTwitterClicked:) forControlEvents:UIControlEventTouchUpInside];
    [btnLogoutFromTwitter addTarget:self action:@selector(btnLogoutFromTwitterClicked:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - To Hide Status Bar

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Other Methods

-(IBAction)btnLoginWithTwitterClicked:(id)sender
{
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
             NSLog(@"signed in as %@", [session userName]);
             
             
             if ([[Twitter sharedInstance] session]) {
                 TWTRShareEmailViewController* shareEmailViewController =
                 [[TWTRShareEmailViewController alloc]
                  initWithCompletion:^(NSString* email, NSError* error) {
                      NSLog(@"Email : %@, Error: %@", email, error);
                  }];
                 [self presentViewController:shareEmailViewController
                                    animated:YES
                                  completion:nil];
             } else {
                 // TODO: Handle user not signed in (e.g.
                 // attempt to log in or show an alert)
             }
             
         } else {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];
}

-(IBAction)btnLogoutFromTwitterClicked:(id)sender
{
    NSLog(@"Logged out from twitter.");
    [[Twitter sharedInstance]logOut];
}

@end
