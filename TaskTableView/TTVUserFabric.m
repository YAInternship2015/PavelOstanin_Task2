//
//  TTVUserFabric.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 27/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUserFabric.h"

@implementation TTVUserFabric

+ (TTVUser *)creatUserWhithName:(NSString *)userName {
    TTVUser *newUser = [[TTVUser alloc] init];
    newUser.userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images"]];
    newUser.userName = userName;
    return newUser;
}

@end
