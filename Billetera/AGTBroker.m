//
//  AGTBroker.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@implementation AGTBroker

- (id)init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

- (AGTMoney *)reduce:(id<AGTMoney>)money
          toCurrency:(NSString *)currency{
    
    // Double dispatch

    return [money reduceToCurrency:currency
                        withBroker:self];
    
}

- (void)addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    [self.rates setObject:@(1.0/rate)
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
}

#pragma mark - Utils

- (NSString *)keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

#pragma mark - Rates

- (void)parseJSONRates:(NSData *)json{
    
    NSError *err = nil;
    id obj =  [NSJSONSerialization JSONObjectWithData:json
                                              options:NSJSONReadingAllowFragments
                                                error:&err];
    if (obj != nil) {
        // Get rates and add to broker
        
    }else{
        // No data
        [NSException raise:@"NoRatesInJSONException"
                    format:@"JSON must carry some data!"];
    }
}

@end
