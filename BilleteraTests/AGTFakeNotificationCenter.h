//
//  AGTFakeNotificationCenter.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTFakeNotificationCenter : NSObject
@property (nonatomic,strong)NSMutableDictionary *observers;

- (void)addObserver:(id)observer
           selector:(nonnull SEL)aSelector
               name:(nullable NSString *)aName
             object:(nullable id)anObject;
@end
