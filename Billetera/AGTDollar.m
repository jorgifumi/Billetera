//
//  AGTDollar.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTDollar.h"
#import "AGTMoney-Private.h"

@implementation AGTDollar

- (AGTDollar *)times:(NSUInteger)multiplier{
    return [[AGTDollar alloc] initWithAmount:[self.amount integerValue] * multiplier];
}

#pragma mark - Overwritten


@end
