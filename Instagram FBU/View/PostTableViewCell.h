//
//  PostTableViewCell.h
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import <Parse/Parse.h>
NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *postImageViewHeightAnchor;
@property (nonatomic, strong) PFUser* _Nullable user;
@property (nonatomic, strong) UIViewController* parentVC;
-(void)setUpFromPost: (Post*)post parentViewControlller: (UIViewController*)parentVC;

@end

NS_ASSUME_NONNULL_END
