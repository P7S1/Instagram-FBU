//
//  Post.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import <Foundation/Foundation.h>
#import "Post.h"
#import <Parse/Parse.h>

@implementation Post
    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;

+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [PFUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    newPost.creationDate = [[NSDate alloc]init];
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (PFFileObject *)getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.2);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.jpg" data:imageData];
}

+ (void) getAllPosts: (getPostsBlock _Nullable)completion;{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    query.limit = 20;

    // fetch data asynchronously
    [query findObjectsInBackgroundWithBlock:^(NSArray *posts, NSError *error) {
        completion(posts,error);
    }];
}




@end
