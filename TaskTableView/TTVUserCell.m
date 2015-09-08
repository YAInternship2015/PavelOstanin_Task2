//
//  TTVUserCell.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUserCell.h"

@interface TTVUserCell ()

#warning (nonatomic, weak)
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation TTVUserCell

- (void)setupWithUser:(TTVUser *)user {
    self.userImageView.image = user.userImage.image;
    self.userNameLabel.text = user.userName;
}

@end
