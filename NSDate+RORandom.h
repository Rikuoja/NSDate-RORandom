//
//  NSDate+RORandom.h
//
//  MIT License
//  Created by Keith Smiley, edited by Riku Oja
//

@interface NSDate (RORandom)

+ (NSDate *)ro_randomDate;
+ (NSDate *)ro_randomDateFromDate:(NSDate *)firstDate uptoDate:(NSDate *) lastDate;

@end
