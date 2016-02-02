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

@implementation AGTMoney

- (id)initWithAmount:(NSInteger)amount{
    if (self = [super init]) {
        _amount = @(amount);
    }
    return self;
}

- (AGTMoney *)times:(NSInteger)multiplier{
    
    // Shouldn't be called, use subclass method insthead
    
    return [self subclassResponsibility:_cmd];
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
