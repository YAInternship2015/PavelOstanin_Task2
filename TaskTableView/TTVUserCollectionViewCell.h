//
//  TTVUserCollectionViewCell.h
//  TaskTableView
//
//  Created by Pavel Ostanin on 25/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTVUser.h"

@interface TTVUserCollectionViewCell : UICollectionViewCell

- (void)setupWithUser:(TTVUser *)user;

@end
