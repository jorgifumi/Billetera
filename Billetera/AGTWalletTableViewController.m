//
//  AGTWalletTableViewController.m
//  Billetera
//
//  Created by Jorge Miguel Lucena Pino on 05/02/16.
//  Copyright © 2016 Jorge Miguel Lucena Pino. All rights reserved.
//

#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"
#import "AGTBroker.h"

static NSString *cellID = @"CellIdentifier";

@interface AGTWalletTableViewController ()
@property (nonatomic, strong)AGTWallet *model;
@end

@implementation AGTWalletTableViewController

- (id)initWithModel:(AGTWallet *)model{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _model = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Billetera";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.model.currencies count] +1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section < [self.model.currencies count]) {
        NSArray *array = [self.model moneysForCurrency:[self.model.currencies objectAtIndex:section]];
        NSLog(@"%@",array);
        return [array count] +1;
    }

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    AGTBroker *broker = [AGTBroker new];
    [broker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    // Configure the cell...
    if (indexPath.section < [self.model.currencies count]) {
        NSString *currency = [self.model.currencies objectAtIndex:indexPath.section];
        NSArray *moneys = [self.model moneysForCurrency:currency];
        if (indexPath.row < [moneys count]) {
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@", [moneys[indexPath.row] description]];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld %ld",(long)indexPath.section, (long)indexPath.row];
        }else{
            // SubTotal
            cell.textLabel.text = [NSString stringWithFormat:@"Subtotal %@", [[self.model subTotalForCurrency:currency] description]];
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld %ld",(long)indexPath.section, (long)indexPath.row];
        }
        
    }else{
        // Grand total
        cell.textLabel.text = [NSString stringWithFormat:@"Total %@", [[self.model reduceToCurrency:@"EUR" withBroker:broker] description]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld %ld",(long)indexPath.section, (long)indexPath.row];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section < [self.model count]) {
        return [self.model.currencies objectAtIndex:section];
    }
    
    return @"Gran Total";
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
