//
//  TTVUserCollectionViewCell.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 25/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUserCollectionViewCell.h"

@interface TTVUserCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

@end

@implementation TTVUserCollectionViewCell

- (void)setupWithUser:(TTVUser *)user {
    self.userImageView.image = user.userImage.image;
}

@end
