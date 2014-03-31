//
//  AddItemViewController.m
//  TaskMaster2
//
//  Created by Flack AP on 3/31/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemToEdit.text;
        self.doneBarButton.enabled = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
    [self.delegate addItemViewControllerDidCancel:self];
}

- (IBAction)done
{
    if (self.itemToEdit == nil) {
        CheckListItem *item = [[CheckListItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
        [self.delegate addItemViewController:self
                         didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        [self.delegate addItemViewController:self didFinishEditingItem:self.itemToEdit];
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *newText = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([newText length] > 0) {
        self.doneBarButton.enabled = YES;
    } else {
        self.doneBarButton.enabled = NO;
    }
    
    return YES;
}
@end
