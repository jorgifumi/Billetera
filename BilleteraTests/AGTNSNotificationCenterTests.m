//
//  AGTNSNotificationCenterTests.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTFakeNotificationCenter.h"
#import "AGTWallet.h"

@interface AGTNSNotificationCenterTests : XCTestCase

@end

@implementation AGTNSNotificationCenterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatSubscribesToMemoryWarning{
    
    AGTFakeNotificationCenter *fake = [AGTFakeNotificationCenter new];
    
    AGTWallet *w = [AGTWallet new];
    [w subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Fat object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
