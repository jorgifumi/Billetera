//
//  AGTMoney.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTMoney.h"
#import "AGTBroker.h"
#import "NSObject+GNUStepAddons.h"

@interface AGTMoney ()
@property (nonatomic, strong) NSNumber* amount;
@end

@implementation AGTMoney

+(id)euroWithAmount:(NSInteger)amount{

    return  [[AGTMoney alloc]initWithAmount:amount currency:@"EUR"];
}

+(id)dollarWithAmount:(NSInteger)amount{
    
    return [[AGTMoney alloc]initWithAmount:amount currency:@"USD"];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

- (id<AGTMoney>)times:(NSInteger)multiplier{
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier
                                                 currency:self.currency];
    
    return  newMoney;
}

- (id<AGTMoney>)plus:(AGTMoney *)other{
    
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    return [[AGTMoney alloc]initWithAmount:totalAmount
                                  currency:self.currency];
}

- (AGTMoney *)reduceToCurrency:(NSString *)currency
                      withBroker:(AGTBroker *)broker{
    
    AGTMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                           toCurrency:currency]]doubleValue];
    // Check if source and destination currencies are the same
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        // NO conversion rate
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion from %@ yo %@", self.currency, currency];
    }else{
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[AGTMoney alloc]initWithAmount:newAmount
                                        currency:currency];
    }
    
    return result;

}

#pragma mark - Overwritten

- (NSString *)description{
    
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], self.currency,self.amount];
}

- (BOOL)isEqual:(id)object{
    
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
    
}

- (NSUInteger)hash{
    
    return [self.amount integerValue];
}

@end
