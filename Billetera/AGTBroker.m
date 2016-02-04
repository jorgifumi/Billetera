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

- (AGTMoney *)reduce:(AGTMoney *)money toCurrency:(NSString *)currency{
    
    return money;
}

- (void)addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString *)toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
}

#pragma mark - Utils

- (NSString *)keyFromCurrency:(NSString *)fromCurrency
                   toCurrency:(NSString *)toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}


@end
