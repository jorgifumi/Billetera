//
//  AGTDollar.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTDollar.h"


@interface AGTDollar()
@property (nonatomic) NSUInteger amount;
@end
@implementation AGTDollar

- (id)initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (AGTDollar *)times:(NSUInteger)multiplier{
    return [[AGTDollar alloc] initWithAmount:self.amount * multiplier];
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

- (NSUInteger)hash{
    
    return (NSUInteger) self.amount;
}

@end
