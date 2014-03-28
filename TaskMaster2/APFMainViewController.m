//
//  APFMainViewController.m
//  TaskMaster2
//
//  Created by Flack AP on 3/27/14.
//  Copyright (c) 2014 Flack AP. All rights reserved.
//

#import "APFMainViewController.h"

@interface APFMainViewController ()

@end

@implementation APFMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    return cell;
}

@end
