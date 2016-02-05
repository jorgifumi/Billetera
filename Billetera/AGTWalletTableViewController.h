//
//  AGTWalletTableViewController.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController

- (id)initWithModel:(AGTWallet *)model;
@end
