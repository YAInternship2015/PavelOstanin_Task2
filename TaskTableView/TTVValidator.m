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
#warning фигурная скобка остается на той же строке, что и имя метода
{
    *error = [NSError new];
#warning можно проще 
//    BOOL success = (string.length >= maxLength);
    BOOL success = string.length < maxLength ? NO : YES;
    
    if (!success) {
#warning зачем нужна следующая проверка?
        if (error) {
#warning из метода должен вернуться сгенерированый NSError, описывающий ошибку валидации, текст которой затем покажет вью контроллер
            *error = [NSError  errorWithDomain:NSURLErrorDomain
                                         code:-42
                                     userInfo:nil];
        }
    }
    
    return success;
}

@end
