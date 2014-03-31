//
//  AddItemViewController.h
//  TaskMaster2
//
//  Created by Flack AP on 3/31/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class CheckListItem;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel: (AddItemViewController *)controller;

- (void)addItemViewController: (AddItemViewController *)controller didFinishAddingItem:(CheckListItem *)item;
@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)done;

@end
