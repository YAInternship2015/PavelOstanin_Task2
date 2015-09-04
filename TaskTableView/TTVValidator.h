//
//  TTVValidator.h
//  TaskTableView
//
//  Created by Pavel Ostanin on 26/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTVValidator : NSObject

- (BOOL)validateString:(NSString *)string
                 error:(NSError * __autoreleasing *)error;

@end
