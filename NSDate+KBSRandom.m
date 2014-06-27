//
//  NSDate+KBSRandom.m
//
//  Created by Keith Smiley
//

#import "NSDate+KBSRandom.h"

@implementation NSDate (KBSRandom)

+ (NSDate *)kbs_randomDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = [self randomNumberFrom:1000 to:3000];
    dateComponents.month = [self randomNumberBetweenOneAndNumber:12];
    dateComponents.day = [self randomNumberBetweenOneAndNumber:20];
    dateComponents.hour = [self randomNumberFrom:0 to:23];
    dateComponents.minute = [self randomNumberBetweenOneAndNumber:59];
    dateComponents.second = [self randomNumberBetweenOneAndNumber:59];

    return [calendar dateFromComponents:dateComponents];
}

+ (NSInteger)randomNumberBetweenOneAndNumber:(NSInteger)number
{
    return [self randomNumberFrom:1 to:number];
}

+ (NSInteger)randomNumberFrom:(NSInteger)lowest to:(NSInteger)highest
{
    return arc4random_uniform((u_int32_t)highest) + lowest;
}

@end
