//
//  AGTFakeNotificationCenter.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTFakeNotificationCenter.h"

@implementation AGTFakeNotificationCenter

- (id) init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addObserver:(id)observer
           selector:(nonnull SEL)aSelector
               name:(nullable NSString *)aName
             object:(nullable id)anObject{
    
    [self.observers setObject:observer
                       forKey:aName];
}
@end
