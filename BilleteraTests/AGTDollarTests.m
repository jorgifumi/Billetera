//
//  AGTDollarTests.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTDollar.h"
#import "AGTMoney.h"

@interface AGTDollarTests : XCTestCase

@end

@implementation AGTDollarTests

- (void)testMultiplication{
    AGTDollar *five = [AGTMoney dollarWithAmount:5];
    AGTDollar *total = [five times:2];
    AGTDollar *ten = [AGTMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}

- (void)testEquality{

    AGTDollar *five = [AGTMoney dollarWithAmount:5];
    AGTDollar *total = [five times:2];
    AGTDollar *ten = [AGTMoney dollarWithAmount:10];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

- (void)testHash{
    
    AGTDollar *a = [AGTMoney dollarWithAmount:2];
    AGTDollar *b = [AGTMoney dollarWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have hash");
}

- (void)testAmountStorage{
    
    AGTDollar *dollar = [AGTMoney dollarWithAmount:2];
    
#pragma clang diagnistic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dollar performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
#pragma clang diagnostic pop
    
}

@end
