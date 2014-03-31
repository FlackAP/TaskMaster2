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

- (void)configureCheckmarkForCell:(UITableViewCell *)cell withCheckListItem:(CheckListItem *)item {
    
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
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
@end
