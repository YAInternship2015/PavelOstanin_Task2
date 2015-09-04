//
//  TTVValidator.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 26/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVValidator.h"

static int maxLength = 3;

@implementation TTVValidator

- (BOOL)validateString:(NSString *)string
                 error:(NSError * __autoreleasing *)error
{
    *error = [NSError new];
    BOOL success = string.length < maxLength ? NO : YES;
    
    if (!success) {
        if (error) {
            *error = [NSError  errorWithDomain:NSURLErrorDomain
                                         code:-42
                                     userInfo:nil];
        }
    }
    
    return success;
}

@end
