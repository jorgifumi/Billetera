//
//  AGTMoney.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 02/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface AGTMoney ()

@property (nonatomic)NSInteger amount;

@end

@implementation AGTMoney

- (id)initWithAmount:(NSInteger)amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (AGTMoney *)times:(NSInteger)multiplier{
    
    // Shouldn't be called, use subclass method insthead
    
    return [self subclassResponsibility:_cmd];
}

@end
