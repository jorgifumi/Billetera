//
//  AGTEuro.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 01/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTEuro.h"
#import "AGTMoney-Private.h"

@implementation AGTEuro

- (AGTEuro *)times:(NSUInteger)multiplier{
    return [[AGTEuro alloc] initWithAmount:[self.amount integerValue] * multiplier];
}

#pragma mark - Overwritten


@end
