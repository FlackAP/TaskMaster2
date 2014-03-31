//
//  CheckListItem.m
//  TaskMaster2
//
//  Created by Flack AP on 3/31/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "CheckListItem.h"

@implementation CheckListItem

- (void)toggleChecked
{
    self.checked = !self.checked;
}

@end
