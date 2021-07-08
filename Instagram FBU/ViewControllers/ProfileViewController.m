//
//  ProfileViewController.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "Post.h"
#import "UserProfile.h"
#import "MediaManager.h"
#import <SDWebImage/SDWebImage.h>
#import "ProfileHeaderCollectionReusableView.h"
#import "PostCollectionViewCell.h"

@interface ProfileViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray<Post*>* posts;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
//    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc]init];
//
//    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 190);
//    layout.itemSize = CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/3);
//
//    self.collectionView.collectionViewLayout = layout;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.posts.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PostCollectionViewCell* cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"PostCollectionViewCell" forIndexPath:indexPath];
    Post* post = self.posts[indexPath.row];
    
    NSURL* url = [[NSURL alloc]initWithString:post.image.url];
    
    if (url){
        [cell.postImageView sd_setImageWithURL:url];
    }else{
        cell.postImageView.image = nil;
    }
    
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        ProfileHeaderCollectionReusableView* header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ProfileHeaderCollectionReusableView" forIndexPath:indexPath];
        
        [header setUpView:self.user withParentViewController:self];
        
        return header;
    }else{
        return [[UICollectionReusableView alloc]init];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width/3, self.view.frame.size.width/3);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 190);
}


@end
