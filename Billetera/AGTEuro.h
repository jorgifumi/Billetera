//
//  AGTEuro.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 01/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTEuro : NSObject

- (id)initWithAmount:(NSUInteger) amount;
- (AGTEuro *)times:(NSUInteger)multiplier;

@end
