//
//  TTVUser.h
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TTVUser : NSObject

@property (strong, nonatomic) UIImageView *userImage;
@property (strong, nonatomic) NSString *userName;

- (instancetype)initWithURL:(NSString *)userImage name:(NSString *)userName;

@end
