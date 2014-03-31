//
//  CheckListItem.h
//  TaskMaster2
//
//  Created by Flack AP on 3/31/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckListItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) BOOL checked;

- (void)toggleChecked;

@end
