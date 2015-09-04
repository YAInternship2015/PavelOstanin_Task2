//
//  TTVDataSource.h
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTVUser.h"

@protocol ModelsDataSourceDelegate <NSObject>

- (void) dataWasChanged;

@end

@interface TTVDataSource : NSObject

@property (nonatomic, weak) id <ModelsDataSourceDelegate> delegate;

- (instancetype)initWithDelegate:(id <ModelsDataSourceDelegate>)delegate;
- (NSInteger)numberOfItems;
- (NSDictionary *)itemAtIndex:(NSInteger)index;
- (void) saveUser:(TTVUser *)user;

@end
