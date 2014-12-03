//
//  NSDate+RORandom.m
//
//  MIT License
//  Created by Keith Smiley, edited by Riku Oja
//

#import "NSDate+RORandom.h"

@implementation NSDate (RORandom)

+ (NSDate *)ro_randomDate
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

+ (NSDate *)ro_randomDateFromDate:(NSDate *)firstDate uptoDate:(NSDate *) lastDate; {
    //the idea is to provide realistic random dates between two given dates
    //the distribution of the dates doesn't need to be even, so each component is just selected randomly given the constraints
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSDateComponents *firstDateComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:firstDate];
    NSDateComponents *lastDateComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:lastDate];
    
    NSInteger firstYear=firstDateComponents.year, lastYear=lastDateComponents.year;
    dateComponents.year = [self randomNumberFrom:firstYear to:lastYear];
    //NSLog([@(dateComponents.year) stringValue]);
    
    NSInteger firstMonth, lastMonth;
    if (dateComponents.year == firstDateComponents.year) firstMonth=firstDateComponents.month;
    else firstMonth=1;
    if (dateComponents.year == lastDateComponents.year) lastMonth=lastDateComponents.month;
    else lastMonth=12;
    dateComponents.month = [self randomNumberFrom:firstMonth to: lastMonth];
    //NSLog([@(dateComponents.month) stringValue]);
    
    NSInteger firstDay, lastDay;
    if (dateComponents.year == firstDateComponents.year && dateComponents.month == firstDateComponents.month) firstDay=firstDateComponents.day;
    else firstDay=1;
    if (dateComponents.year == lastDateComponents.year && dateComponents.month == lastDateComponents.month) lastDay=lastDateComponents.day;
    //here the last day of the month has to be obtained from the calendar
    else lastDay=NSMaxRange([calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[calendar dateFromComponents:dateComponents]])-1;
    dateComponents.day = [self randomNumberFrom:firstDay to:lastDay];
    //NSLog([@(dateComponents.day) stringValue]);
    
    NSInteger firstHour, lastHour;
    if (dateComponents.year == firstDateComponents.year && dateComponents.month == firstDateComponents.month && dateComponents.day == firstDateComponents.day) firstHour=firstDateComponents.hour;
    else firstHour=0;
    if (dateComponents.year == lastDateComponents.year && dateComponents.month == lastDateComponents.month && dateComponents.day == lastDateComponents.day) lastHour=lastDateComponents.hour;
    else lastHour=23;
    dateComponents.hour = [self randomNumberFrom:firstHour to:lastHour];
    
    NSInteger firstMinute, lastMinute;
    if (dateComponents.year == firstDateComponents.year && dateComponents.month == firstDateComponents.month && dateComponents.day == firstDateComponents.day && dateComponents.hour == firstDateComponents.hour) firstMinute=firstDateComponents.minute;
    else firstMinute=0;
    if (dateComponents.year == lastDateComponents.year && dateComponents.month == lastDateComponents.month && dateComponents.day == lastDateComponents.day && dateComponents.hour == lastDateComponents.hour) lastMinute=lastDateComponents.minute;
    else lastMinute=59;
    dateComponents.minute = [self randomNumberFrom:firstMinute to:lastMinute];
    
    NSInteger firstSecond, lastSecond;
    if (dateComponents.year == firstDateComponents.year && dateComponents.month == firstDateComponents.month && dateComponents.day == firstDateComponents.day && dateComponents.hour == firstDateComponents.hour && dateComponents.minute == firstDateComponents.minute) firstSecond=firstDateComponents.second;
    else firstSecond=0;
    if (dateComponents.year == lastDateComponents.year && dateComponents.month == lastDateComponents.month && dateComponents.day == lastDateComponents.day && dateComponents.hour == lastDateComponents.hour && dateComponents.minute == lastDateComponents.minute) lastSecond=lastDateComponents.second;
    else lastSecond=59;
    dateComponents.hour = [self randomNumberFrom:firstHour to:lastHour];
    
    return [calendar dateFromComponents:dateComponents];
    
}

+ (NSInteger)randomNumberBetweenOneAndNumber:(NSInteger)number
{
    return [self randomNumberFrom:1 to:number];
}

+ (NSInteger)randomNumberFrom:(NSInteger)lowest to:(NSInteger)highest
{
    return arc4random_uniform((u_int32_t)(highest-lowest)+1) + lowest; //fixed error in the range of numbers
}

@end
