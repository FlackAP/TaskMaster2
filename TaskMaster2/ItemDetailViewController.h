//
//  AddItemViewController.h
//  TaskMaster2
//
//  Created by Flack AP on 3/31/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class CheckListItem;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel: (ItemDetailViewController *)controller;
- (void)addItemViewController: (ItemDetailViewController *)controller didFinishAddingItem:(CheckListItem *)item;
- (void)addItemViewController: (ItemDetailViewController *)controller didFinishEditingItem:(CheckListItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;
@property (nonatomic, strong) CheckListItem *itemToEdit;

- (IBAction)cancel;
- (IBAction)done;

@end
