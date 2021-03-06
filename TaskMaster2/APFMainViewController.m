//
//  APFMainViewController.m
//  TaskMaster2
//
//  Created by Flack AP on 3/27/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "APFMainViewController.h"
#import "ChecklistItem.h"

@interface APFMainViewController ()

@end

@implementation APFMainViewController
{
    NSMutableArray *_items;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    CheckListItem *item;
    
    item = [[CheckListItem alloc] init];
    item.text = @"Walk the dog";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"Brush my teeth";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"Learn iOS development";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"Buy cold beers";
    item.checked = YES;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"Drink cold beers";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[CheckListItem alloc] init];
    item.text = @"Buy more cold beers";
    item.checked = NO;
    [_items addObject:item];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [_items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell
                withCheckListItem:(CheckListItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    if (item.checked) {
        label.text = @"√";
    } else {
        label.text = @"";
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item {
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    
    label.text = item.text;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    CheckListItem *item = _items[indexPath.row];
    [self configureTextForCell:cell withCheckListItem:item];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CheckListItem *item = _items[indexPath.row];
    [item toggleChecked];
    [self configureCheckmarkForCell:cell withCheckListItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)addItem
{
    NSInteger newRowIndex = [_items count];
    CheckListItem *item = [[CheckListItem alloc] init];
    item.text = @"I am a new row";
    item.checked = NO;
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_items removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)addItemViewControllerDidCancel: (ItemDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemViewController: (ItemDetailViewController *)controller didFinishAddingItem:(CheckListItem *)item{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath
                              indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController =
        segue.destinationViewController;
        ItemDetailViewController *controller =
        (ItemDetailViewController *)
        navigationController.topViewController;
        controller.delegate = self;
        NSIndexPath *indexPath = [self.tableView
                                  indexPathForCell:sender];
        controller.itemToEdit = _items[indexPath.row];
    }
}

- (void)addItemViewController:(ItemDetailViewController *)controller didFinishEditingItem:(CheckListItem *)item {
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withCheckListItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
