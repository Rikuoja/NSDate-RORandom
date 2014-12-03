//
//  ExampleTests.m
//  ExampleTests
//
//  MIT License
//  Created by Keith Smiley, edited by Riku Oja
//

#import <XCTest/XCTest.h>
#import "NSDate+RORandom.h"

@interface ExampleTests : XCTestCase

@end

@implementation ExampleTests

- (void)testExample
{
    NSDate *date1 = [NSDate ro_randomDate];
    NSDate *date2 = [NSDate ro_randomDate];

    XCTAssertFalse([date1 isEqualToDate:date2], @"Random dates should not be equal");
}

- (void)testFromDateUptoDate {
    for (int i=1; i<10000; i++) {
        NSDate *date1 = [NSDate ro_randomDate];
        NSDate *date2 = [NSDate ro_randomDate];
        NSDate *firstDate=[date1 earlierDate:date2];
        NSDate *lastDate=[date1 laterDate:date2];
        NSDate *date3 = [NSDate ro_randomDateFromDate:firstDate uptoDate:lastDate];
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSLog([NSString stringWithFormat:@"%@/%@/%@",[dateFormatter stringFromDate:firstDate],[dateFormatter stringFromDate:lastDate],[dateFormatter stringFromDate:date3]]);
        XCTAssertFalse([[firstDate earlierDate:date3] isEqual:date3], @"Random date is too early");
        XCTAssertFalse([[lastDate earlierDate:date3] isEqual:date2], @"Random date is too late");
    }
}


@end
