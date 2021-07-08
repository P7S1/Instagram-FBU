//
//  Post.h
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

//  Post.h
#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "Post.h"
@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

@property (nonatomic, strong) NSDate *creationDate;

@property (nonatomic) CGFloat aspectRatio;


+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withAspectRatio: (CGFloat) aspectRatio withCompletion: (PFBooleanResultBlock  _Nullable)completion;

typedef void(^getPostsBlock)(NSArray<Post*>* _Nullable posts, NSError* _Nullable error);

+ (void) getAllPosts: (getPostsBlock _Nullable)completion;

@end
