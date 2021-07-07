//
//  MediaManager.h
//  Instagram FBU
//
//  Created by Keng Fontem on 7/7/21.
//
@interface MediaManager : NSObject

+(CGFloat) getImageAspectRatio: (CGSize) size;
+ (NSString *)timeAgoStringFromDate:(NSDate *)date;

@end
