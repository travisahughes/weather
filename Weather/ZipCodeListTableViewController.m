//
//  ZipCodeListTableViewController.m
//  Weather
//
//  Created by Travis Hughes on 2/14/15.
//  Copyright (c) 2015 Travis Hughes. All rights reserved.
//

#import "ZipCodeListTableViewController.h"
#import "ZipCodeItem.h"
#import "AddZipCodeItemViewController.h"

@interface ZipCodeListTableViewController ()

@property NSMutableArray *zipCodeItems;

@end

@implementation ZipCodeListTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddZipCodeItemViewController *source = [segue sourceViewController];
    ZipCodeItem *item = source.zipCodeItem;
    
    if(item != nil){
        [self.zipCodeItems addObject:item];
        [self.tableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zipCodeItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    ZipCodeItem *item1 = [[ZipCodeItem alloc] init];
    item1.itemZipCode = @"10001";
    [self.zipCodeItems addObject:item1];
    
    ZipCodeItem *item2 = [[ZipCodeItem alloc] init];
    item2.itemZipCode = @"11103";
    [self.zipCodeItems addObject:item2];
    
    ZipCodeItem *item3 = [[ZipCodeItem alloc] init];
    item3.itemZipCode = @"10016";
    [self.zipCodeItems addObject:item3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.zipCodeItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    ZipCodeItem *zipCodeItem = [self.zipCodeItems objectAtIndex:indexPath.row];
    cell.textLabel.text = zipCodeItem.itemZipCode;
    if(zipCodeItem.selected){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ZipCodeItem *tappedItem = [self.zipCodeItems objectAtIndex:indexPath.row];
    tappedItem.selected = !tappedItem.selected;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
