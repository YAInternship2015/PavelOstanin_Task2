//
//  TTVUserFabric.h
//  TaskTableView
//
//  Created by Pavel Ostanin on 27/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTVUser.h"

@interface TTVUserFabric : NSObject

+ (TTVUser *)creatUserWhithName:(NSString *)userName;

@end
