//
//  AGTBroker.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

- (AGTMoney *)reduce:(id<AGTMoney>)money toCurrency:(NSString *)currency;
- (void)addRate:(NSInteger)rate fromCurrency:(NSString *)fromCurrency toCurrency:(NSString *)toCurrency;
- (NSString *)keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency;
- (void)parseJSONRates:(NSData *)json;

@end
