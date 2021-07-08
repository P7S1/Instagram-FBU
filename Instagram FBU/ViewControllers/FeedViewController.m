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
#import "PostTableViewCell.h"
@interface FeedViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<Post*>* posts;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl* refreshControl;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@
                              "instagram"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = imageView;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self configureRefreshControl];
    
    [self getPosts];
}

-(void) configureRefreshControl{
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(getPosts) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:self.refreshControl];
}

-(void) getPosts{
    NSLog(@"Getting posts...");
    [Post getAllPosts:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (error == nil){
            NSLog(@"Getting posts was successful");
            self.posts = posts;;
            [self.tableView reloadData];
            
            if (self.refreshControl.isRefreshing){
                [self.refreshControl endRefreshing];
            }
            
        }else{
            NSLog(@"Getting Posts Failed");
            NSLog(@"%@", [error localizedDescription]);
        }
        
    }];
}

- (IBAction)logoutButtonPressed:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController* vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    
    }];
}

//MARK:- UITableViewDeleagte + Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostTableViewCell"];
    [cell setUpFromPost:self.posts[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end