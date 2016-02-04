//
//  AGTMoney.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;

@protocol AGTMoney <NSObject>

- (id)initWithAmount:(NSInteger)amount
            currency:(NSString *)currency;

- (id<AGTMoney>)times:(NSInteger)multiplier;
- (id<AGTMoney>)plus:(AGTMoney *)other;

-(id<AGTMoney>)reduceToCurrency:(NSString *)currency withBroker:(AGTBroker *)broker;

@end

@interface AGTMoney : NSObject<AGTMoney>
@property (nonatomic, readonly) NSString *currency;

+(id)euroWithAmount:(NSInteger)amount;
+(id)dollarWithAmount:(NSInteger)amount;

@end
