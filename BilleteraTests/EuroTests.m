//
//  EuroTests.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 01/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTEuro.h"

@interface EuroTests : XCTestCase

@end

@implementation EuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleMultiplication{
 
    AGTEuro *five = [[AGTEuro alloc]initWithAmount: 5];
    AGTEuro *ten = [[AGTEuro alloc]initWithAmount:10];
    AGTEuro *product = [five times:2];
    
    XCTAssertEqualObjects(product, ten, @"€5 * 2 should be €10");
}

- (void)testEquality{
    
    AGTEuro *five = [[AGTEuro alloc]initWithAmount:5];
    AGTEuro *ten = [[AGTEuro alloc]initWithAmount:10];
    AGTEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal!");
}

- (void)testHash{
    
    AGTEuro *a = [[AGTEuro alloc]initWithAmount:2];
    AGTEuro *b = [[AGTEuro alloc]initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have hash");
}



@end
