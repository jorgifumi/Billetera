//
//  AGTWallet.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

@import UIKit;
#import "AGTMoney.h"

@interface AGTWallet : NSObject<AGTMoney>
@property (nonatomic,readonly)NSUInteger count;
@property (nonatomic,strong)NSArray *currencies;

- (NSArray *)moneysForCurrency:(NSString *)currency;
- (id<AGTMoney>)subTotalForCurrency:(NSString *)currency;
- (void)subscribeToMemoryWarning:(NSNotificationCenter *)nc;
@end
