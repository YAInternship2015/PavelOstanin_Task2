//
//  TTVUsersCollectionViewController.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 25/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUsersCollectionViewController.h"
#import "TTVUserCollectionViewCell.h"
#import "TTVDataSource.h"
#import "TTVUser.h"

@interface TTVUsersCollectionViewController () <ModelsDataSourceDelegate>

@property (strong, nonatomic) TTVDataSource *dataSource;

@end

@implementation TTVUsersCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = [[TTVDataSource alloc] initWithDelegate:self];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource numberOfItems];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TTVUserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setupWithUser:[[TTVUser alloc] initWithURL:[self.dataSource itemAtIndex:indexPath.row][@"userImage"]
                                                name:[self.dataSource itemAtIndex:indexPath.row][@"userName"]]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellWidth = ((CGRectGetWidth([UIScreen mainScreen].bounds)) - 10.0)/2.0;
    CGFloat cellHeight = cellWidth;
    return CGSizeMake(cellWidth, cellHeight);
}

- (void)dataWasChanged {
    [self.collectionView reloadData];
}

@end
