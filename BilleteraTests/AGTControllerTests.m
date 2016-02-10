//
//  AGTControllerTests.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTControllerTests : XCTestCase
@property (nonatomic,strong) AGTSimpleViewController *simpleVC;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) AGTWalletTableViewController *walletVC;
@property (nonatomic,strong) AGTWallet *wallet;
@end

@implementation AGTControllerTests

- (void)setUp {
    [super setUp];
    
    self.simpleVC = [[AGTSimpleViewController alloc]initWithNibName:nil bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[AGTWallet alloc]initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    self.walletVC = [[AGTWalletTableViewController alloc]initWithModel:self.wallet];
}

- (void)tearDown {
    
    [super tearDown];
    
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

- (void)testThatTextOnLabelIsEqualToTextOnButton {
    
    // Send message
    [self.simpleVC displayText:self.button];
    
    // Check that label and button have the same text
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

- (void)testThatNumberOfSectionsIsNumberOfCurrenciesPlusOne {
    
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    NSUInteger currencies = self.wallet.numberOfCurrencies;
    
    XCTAssertEqual(sections, currencies + 1, @"Number of sections should be the number of currencies plus one");
}

- (void)testThatNumberOfCellsIsNumberofMoneyPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells should be the number of moneys plus one");
}

- (void)testThatLastSectionHasOnlyOneCell {
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(1, [self.walletVC tableView:nil numberOfRowsInSection:sections], @"Number of cells in last section should be one");
}


@end
