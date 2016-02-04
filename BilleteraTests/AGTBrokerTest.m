//
//  AGTBrokerTest.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTBrokerTest : XCTestCase

@end

@implementation AGTBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleReduction{
    AGTBroker *broker = [[AGTBroker alloc]init];
    AGTMoney *sum = [[AGTMoney dollarWithAmount:5]plus:[AGTMoney dollarWithAmount:5]];
    
    AGTMoney *reduced = [broker reduce:sum toCurrency: @"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currecy should be a NOP");
}

- (void)testReduction{
    
    AGTBroker *broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"USD" toCurrency:@"EUR"];
    
    AGTMoney *dollars = [AGTMoney dollarWithAmount:10];
    AGTMoney *euros = [AGTMoney euroWithAmount:5];
    AGTMoney *converted = [broker reduce:dollars toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == $5 2:1");
}

@end
