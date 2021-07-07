//
//  MediaManager.m
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//

#import <UIKit/UIKit.h>
#import "MediaManager.h"

@implementation MediaManager : NSObject

+(CGFloat) getImageAspectRatio: (CGSize) size{
    CGFloat aspectRatio = size.height / size.width;
    if (aspectRatio < 0.5){
        return 0.5;
    }else if (aspectRatio > 1.5){
        return 1.5;
    }else{
        return aspectRatio;
    }
}
@end
