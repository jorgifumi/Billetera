//
//  AGTNetworkTests.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTBroker.h"

@interface AGTNetworkTests : XCTestCase

@end

@implementation AGTNetworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatEmptyRatesRaisesException {
    
    AGTBroker *broker = [AGTBroker new];
    NSData *jsonData = nil;
    
    XCTAssertThrows([broker parseJSONRates:jsonData], @"An empty JSON should raise exception");
    
}

@end
