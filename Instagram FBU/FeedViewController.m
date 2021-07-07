//
//  FeedViewController.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import "FeedViewController.h"
#import <Parse/Parse.h>
#import "LoginViewController.h"
#import "Post.h"
@interface FeedViewController ()

@property (nonatomic, strong) NSMutableArray<Post*>* posts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@
                              "instagram"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageView;
    
}

- (IBAction)logoutButtonPressed:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    
    }];
}

@end
