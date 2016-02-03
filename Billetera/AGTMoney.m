//
//  AGTMoney.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "AGTMoney-Private.h"
#import "AGTEuro.h"
#import "AGTDollar.h"

@implementation AGTMoney

+(id)euroWithAmount:(NSInteger)amount{

    return  [[AGTEuro alloc]initWithAmount:amount];
}

+(id)dollarWithAmount:(NSInteger)amount{
    
    return [[AGTDollar alloc]initWithAmount:amount];
}

- (id)initWithAmount:(NSInteger)amount{
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

- (id)times:(NSInteger)multiplier{
    
    AGTMoney *newMoney = [[AGTMoney alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
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