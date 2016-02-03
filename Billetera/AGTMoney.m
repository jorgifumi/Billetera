//
//  AGTMoney.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTMoney.h"
#import "NSObject+GNUStepAddons.h"


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

- (id)times:(NSInteger)multiplier{
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier
                                                 currency:self.currency];
    
    return  newMoney;
}

#pragma mark - Overwritten

- (NSString *)description{
    
    return [NSString stringWithFormat:@" <%@ %ld", [self class], (long)[self amount]];
}

- (BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

- (NSUInteger)hash{
    
    return (NSUInteger) self.amount;
}

@end
