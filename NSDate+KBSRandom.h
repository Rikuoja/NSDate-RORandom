//
//  NSDate+KBSRandom.h
//
//  MIT License
//  Created by Keith Smiley, edited by Riku Oja
//

@interface NSDate (KBSRandom)

+ (NSDate *)kbs_randomDate;
+ (NSDate *)kbs_randomDateFromDate:(NSDate *)firstDate uptoDate:(NSDate *) lastDate;

@end
