//
//  FeedViewController.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"
@interface FeedViewController ()

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)logoutButtonPressed:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    
    }];
}

@end
