//
//  AGTEuro.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 01/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTEuro.h"

@interface AGTEuro()
@property (nonatomic) NSUInteger amount;
@end
@implementation AGTEuro

- (id)initWithAmount:(NSUInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}
- (AGTEuro *)times:(NSUInteger)multiplier{
    return [[AGTEuro alloc] initWithAmount:self.amount * multiplier];
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object{
    
    return [self amount] == [object amount];
}

@end
