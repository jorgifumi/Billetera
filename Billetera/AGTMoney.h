//
//  AGTMoney.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject

- (id)initWithAmount:(NSInteger)amount;

- (AGTMoney *)times:(NSInteger)multiplier;

@end
