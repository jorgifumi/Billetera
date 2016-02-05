//
//  AGTWallet.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 04/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTWallet : NSObject<AGTMoney>
@property (nonatomic,readonly)NSUInteger count;
@end
