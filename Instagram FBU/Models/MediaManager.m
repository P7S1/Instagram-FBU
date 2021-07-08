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

+ (NSString *)timeAgoStringFromDate:(NSDate *)date {
    NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc] init];
    formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;

    NSDate *now = [NSDate date];

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond)
                                               fromDate:date
                                                 toDate:now
                                                options:0];

    if (components.year > 0) {
        formatter.allowedUnits = NSCalendarUnitYear;
    } else if (components.month > 0) {
        formatter.allowedUnits = NSCalendarUnitMonth;
    } else if (components.weekOfMonth > 0) {
        formatter.allowedUnits = NSCalendarUnitWeekOfMonth;
    } else if (components.day > 0) {
        formatter.allowedUnits = NSCalendarUnitDay;
    } else if (components.hour > 0) {
        formatter.allowedUnits = NSCalendarUnitHour;
    } else if (components.minute > 0) {
        formatter.allowedUnits = NSCalendarUnitMinute;
    } else {
        formatter.allowedUnits = NSCalendarUnitSecond;
    }

    NSString *formatString = NSLocalizedString(@"%@ ago", @"Used to say how much time has passed. e.g. '2 hours ago'");

    return [NSString stringWithFormat:formatString, [formatter stringFromDateComponents:components]];
}
@end
