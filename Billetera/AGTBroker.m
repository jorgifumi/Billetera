//
//  AGTBroker.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@interface AGTBroker ()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation AGTBroker

- (id)init{
    if (self = [super init]){
        _rates = [@{}mutableCopy];
    }
    return self;
}

- (AGTMoney *)reduce:(AGTMoney *)money
          toCurrency:(NSString *)currency{
    
    AGTMoney *result;
    double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                          toCurrency:currency]]doubleValue];
    // Check if source and destination currencies are the same
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        // NO conversion rate
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ yo %@", money.currency, currency];
    }else{
        
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[AGTMoney alloc]initWithAmount:newAmount
                                                    currency:currency];
    }
    
    return result;
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


@end
