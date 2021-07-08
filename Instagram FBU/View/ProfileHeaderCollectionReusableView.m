//
//  ProfileHeaderCollectionReusableView.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/8/21.
//

#import "ProfileHeaderCollectionReusableView.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "UserProfile.h"
#import "MediaManager.h"
#import <SDWebImage/SDWebImage.h>

@interface ProfileHeaderCollectionReusableView() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end
@implementation ProfileHeaderCollectionReusableView

- (void)setUpView:(PFUser *)user withParentViewController:(UIViewController *)parentVC{
    self.parentVC = parentVC;
    self.user = user;
    
    if (self.user == nil){
        self.user = PFUser.currentUser;
    }
    [self setUpProfileImageView];

    self.usernameLabel.text = self.user.username;
    self.followButton.layer.cornerRadius = self.followButton.frame.size.height/2;
}

-(void) setUpProfileImageView{
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(profileImageViewPressed)];
    [self.profileImageView addGestureRecognizer:gestureRecognizer];
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2;
    [self.profileImageView setUserInteractionEnabled:YES];
    
    [MediaManager getCurrentUserProfileURL:^(NSURL * _Nullable url, NSError * _Nullable error) {
        NSLog(@"got current user profileurl");
        NSLog(@"%@", [error localizedDescription]);
        [self.profileImageView sd_setImageWithURL:url];
    }];
    
    
}

-(void) profileImageViewPressed{
    UIImagePickerController* pickerController = [[UIImagePickerController alloc]init];
    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerController.delegate = self;
    [self.parentVC presentViewController:pickerController animated:YES completion:nil];
}

- (IBAction)followButtonPressed:(id)sender {
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (image == nil) { return; }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    self.profileImageView.image = image;
    
    PFFileObject* file = [Post getPFFileFromImage:image];
    
    UserProfile* profile = [UserProfile new];
    
    profile.profileImage = file;
    profile.userId = PFUser.currentUser.objectId;
    
    [profile saveInBackground];
}


@end
