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

- (void)testThatTimesRaisesException{
    
    AGTMoney *money = [[AGTMoney alloc]initWithAmount:1];
    
    XCTAssertThrows([money times:2], @"Should raise an exception");
}
@end
