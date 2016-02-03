//
//  AGTMoney.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTMoney : NSObject
@property (nonatomic, ) NSNumber* amount;
@property (nonatomic, readonly) NSString *currency;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;

- (id)initWithAmount:(NSInteger)amount
            currency:(NSString *)currency;

- (id)times:(NSInteger)multiplier;

@end
