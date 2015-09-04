//
//  TTVUser.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVUser.h"

@implementation TTVUser

- (instancetype)initWithURL:(NSString *)userImage name:(NSString *)userName {
    self = [super init];
    if (self) {
        _userImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",userImage]]];
        _userName = userName;
    }
    return self;
}

@end

