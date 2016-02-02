//
//  AGTDollar.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"


@interface AGTDollar : AGTMoney

- (id)initWithAmount:(NSUInteger) amount;
- (AGTDollar *)times:(NSUInteger)multiplier;

@end
