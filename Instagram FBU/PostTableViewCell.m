//
//  PostTableViewCell.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import "PostTableViewCell.h"
#import "Post.h"
#import <SDWebImage/SDWebImage.h>
@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

-(void)setUpFromPost: (Post*)post{
    self.captionLabel.text = post.caption;
    NSURL* url = [[NSURL alloc]initWithString:post.image.url];
    if (url != nil){
        [self.postImageView sd_setImageWithURL:url];
    }
}

@end
