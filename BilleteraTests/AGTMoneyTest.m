//
//  AGTMoneyTest.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"

@interface AGTMoneyTest : XCTestCase

@end

@implementation AGTMoneyTest

- (void)testCurrecies{
    
    XCTAssertEqualObjects(@"EUR", [[AGTMoney euroWithAmount:1] currency], @"The currency of 1€ should be EUR");
    XCTAssertEqualObjects(@"USD", [[AGTMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD");
}

- (void)testSimpleMultiplication{
    
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *ten = [AGTMoney euroWithAmount:10];
    AGTMoney *product = [five times:2];
    
    XCTAssertEqualObjects(product, ten, @"€5 * 2 should be €10");
    
    XCTAssertEqualObjects([AGTMoney dollarWithAmount:10], [[AGTMoney dollarWithAmount:5] times:2], @"$5 * 2 = $10");
}

- (void)testEquality{
    
    AGTMoney *five = [AGTMoney euroWithAmount:5];
    AGTMoney *ten = [AGTMoney euroWithAmount:10];
    AGTMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
    
    XCTAssertEqualObjects([AGTMoney dollarWithAmount:10], total, @"Equivalent objects should be equal");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects should not be equal");
}

- (void)testHash{
    
    AGTMoney *a = [AGTMoney euroWithAmount:2];
    AGTMoney *b = [AGTMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have hash");
    XCTAssertEqual([[AGTMoney dollarWithAmount:1] hash], [[AGTMoney dollarWithAmount:1] hash], @"Equal objects must have hash");
}

- (void)testAmountStorage{
    
    AGTMoney *euro = [AGTMoney euroWithAmount:2];
    
#pragma clang diagnistic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");
    XCTAssertEqual(2, [[[AGTMoney dollarWithAmount:2] performSelector:@selector(amount)]integerValue], @"The value retrieved should be the same as the stored");

#pragma clang diagnostic pop
    
}

@end
