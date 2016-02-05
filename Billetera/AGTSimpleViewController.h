//
//  AGTSimpleViewController.h
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTSimpleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)displayText:(id)sender;

@end
