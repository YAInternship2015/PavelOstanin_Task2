//
//  TTVUsersTableViewController.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUsersTableViewController.h"
#import "TTVUserCell.h"
#import "TTVDataSource.h"
#import "TTVUser.h"
#import "TTVNewItemViewController.h"

@interface TTVUsersTableViewController () <ModelsDataSourceDelegate>

@property (strong, nonatomic) TTVDataSource *dataSource;

@end

@implementation TTVUsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[TTVDataSource alloc] initWithDelegate:self];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifer = @"Cell";
    TTVUserCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifer];
    [cell setupWithUser:[[TTVUser alloc] initWithURL:[self.dataSource itemAtIndex:indexPath.row][@"userImage"]
                                                name:[self.dataSource itemAtIndex:indexPath.row][@"userName"]]];
    return cell;
}

#pragma mark - data source delegate

- (void)dataWasChanged {
    [self.tableView reloadData];
}

@end
