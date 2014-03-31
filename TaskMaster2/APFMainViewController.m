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
        CheckListItem *_row0item;
        CheckListItem *_row1item;
        CheckListItem *_row2item;
        CheckListItem *_row3item;
        CheckListItem *_row4item;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _row0item = [[CheckListItem alloc] init];
    _row0item.text = @"Walk the dog";
    _row0item.checked = NO;
    
    _row1item = [[CheckListItem alloc] init];
    _row1item.text = @"Brush my teeth";
    _row1item.checked = YES;
    
    _row2item = [[CheckListItem alloc] init];
    _row2item.text = @"Learn iOS development";
    _row2item.checked = YES;
    
    _row3item = [[CheckListItem alloc] init];
    _row3item.text = @"Soccer practice";
    _row3item.checked = NO;
    
    _row4item = [[CheckListItem alloc] init];
    _row4item.text = @"Eat ice cream";
    _row4item.checked = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    BOOL isChecked = NO;
    
    if (indexPath.row == 0) {
        isChecked = _row0item.checked;
    } else if (indexPath.row == 1) {
        isChecked = _row1item.checked;
    } else if (indexPath.row == 2) {
        isChecked = _row2item.checked;
    } else if (indexPath.row == 3) {
        isChecked = _row3item.checked;
    } else if (indexPath.row == 4) {
        isChecked = _row4item.checked;
    }
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    if (indexPath.row == 0) {
        label.text = _row0item.text;
    } else if (indexPath.row == 1) {
        label.text = _row1item.text;
    } else if (indexPath.row == 2) {
        label.text = _row2item.text;
    } else if (indexPath.row == 3) {
        label.text = _row3item.text;
    } else if (indexPath.row == 4) {
        label.text = _row4item.text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        _row0item.checked = !_row0item.checked;
    } else if (indexPath.row == 1) {
        _row1item.checked = !_row1item.checked;
    } else if (indexPath.row == 2) {
        _row2item.checked = !_row2item.checked;
    } else if (indexPath.row == 3) {
        _row3item.checked = !_row3item.checked;
    } else if (indexPath.row == 4) {
        _row4item.checked = !_row4item.checked;
    }
        
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
