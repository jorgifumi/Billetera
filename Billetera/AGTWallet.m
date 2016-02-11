//
//  AGTWallet.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTWallet.h"
#import "AGTMoney.h"
#import "AGTBroker.h"

@interface AGTWallet ()
@property (nonatomic, strong)NSMutableDictionary *moneys;
@end

@implementation AGTWallet
- (NSUInteger)count {
    return [self.moneys count];
}

- (NSArray *)currencies {

    return [self.moneys allKeys];
}

- (id)initWithAmount:(NSInteger)amount currency:(NSString *)currency {
    
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc]initWithAmount:amount currency:currency];
        _moneys = [[NSMutableDictionary alloc] initWithCapacity:1];
        [_moneys setObject:@[money] forKey:money.currency];
    }
    return self;
}

- (id<AGTMoney>)plus:(AGTMoney *)other{
    
    NSMutableArray *newMoneys = [self.moneys objectForKey:other.currency];
    if (!newMoneys) {
        newMoneys = [NSMutableArray arrayWithObject:other];
    }else{
        [newMoneys addObject:other];
    }
    
    [self.moneys setObject:newMoneys forKey:other.currency];
    return self;
}

- (id<AGTMoney>)times:(NSInteger)multiplier{
    
//    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
//    for (AGTMoney *each in self.moneys) {
//        AGTMoney *newMoney = [each times:multiplier];
//        [newMoneys addObject:newMoney];
//    }
//    self.moneys = newMoneys;
    return self;
}

- (id<AGTMoney>)reduceToCurrency:(NSString *)currency
                      withBroker:(AGTBroker *)broker{
    
    AGTMoney *result =  [[AGTMoney alloc]initWithAmount:0 currency:currency];
   
    for (NSString *each in self.currencies) {
        for (AGTMoney *money in [self.moneys objectForKey:each]) {
            result = [result plus:[money reduceToCurrency:currency withBroker:broker]];
        }
    }
    
    return result;
}

- (NSString *)moneyForRow:(NSInteger)row atIndex:(NSInteger)index{
    AGTMoney *money = [self.moneys objectForKey:[self.currencies objectAtIndex:index]][row];
    
    return [money description];
}

#pragma mark - Notifications
- (void)subscribeToMemoryWarning:(NSNotificationCenter *)nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

- (void)dumpToDisk:(NSNotification *)notification{
    
}

@end
