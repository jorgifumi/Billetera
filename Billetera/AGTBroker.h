//
//  AGTBroker.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;

@interface AGTBroker : NSObject

- (AGTMoney *)reduce:(AGTMoney *)money toCurrency:(NSString *)currency;
- (void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;

@end
