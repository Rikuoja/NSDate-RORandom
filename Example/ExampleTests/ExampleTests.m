//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Keith Smiley on 6/27/14.
//  Copyright (c) 2014 smileykeith. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+KBSRandom.h"

@interface ExampleTests : XCTestCase

@end

@implementation ExampleTests

- (void)testExample
{
    NSDate *date1 = [NSDate kbs_randomDate];
    NSDate *date2 = [NSDate kbs_randomDate];

    XCTAssertFalse([date1 isEqualToDate:date2], @"Random dates should not be equal");
}

@end
