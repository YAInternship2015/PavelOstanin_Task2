//
//  TTVDataSource.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 13/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVDataSource.h"

@interface TTVDataSource()

#warning (nonatomic, strong)
#warning также этот массив должен хранить модели, а не NSDictionary
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation TTVDataSource

- (instancetype)initWithDelegate:(id <ModelsDataSourceDelegate>)delegate {
    self = [super init];
    if (self) {
#warning следующую логику вынесите в отдельный метод
        NSString *path = [self pathToDocumentDirectory];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
#warning не нужен пробел после :
        if (![fileManager fileExistsAtPath: path]) {
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
            _data = [NSMutableArray arrayWithContentsOfFile:bundlePath];
            [_data writeToFile:path atomically:YES];
        }
        else {
            _data = [NSMutableArray arrayWithContentsOfFile:path];
        }
    }
#warning имя нотификейшна только в этом классе повторяется трижды. Его следует вынести в константы в отдельный файл вроде TTVNotifications.h
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveTestNotification:)
                                                 name:@"DataFileContentDidChange"
                                               object:nil];
    _delegate = delegate;
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)numberOfItems {
    return [self.data count];
}

- (NSDictionary *)itemAtIndex:(NSInteger)index {
    return self.data[index];
}

#warning этот метод лучше вынести в категорию к NSBundle или NSFileManager
- (NSString *)pathToDocumentDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    return path;
}
#pragma mark - notification methods

- (void) receiveTestNotification:(NSNotification *) notification {
    if ([[notification name] isEqualToString:@"DataFileContentDidChange"]) {
        NSString *path = [self pathToDocumentDirectory];
        _data = [NSMutableArray arrayWithContentsOfFile:path];
        [self.delegate dataWasChanged];
    }
}

#pragma mark - save to property list

- (void) saveUser:(TTVUser *)user {
    NSString *path = [self pathToDocumentDirectory];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSMutableArray *data;
    
    if ([fileManager fileExistsAtPath: path]) {
        data = [NSMutableArray arrayWithContentsOfFile:path];
    }
    else {
        data = [[NSMutableArray alloc] init];
    }
#warning преобразование модели в NSDictionary должно быть в категории к модели, в методе типа -dictionaryRepresentation
    [data addObject:@{@"userImage" : @"images", @"userName" : user.userName}];
    [data writeToFile:path atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DataFileContentDidChange" object:self];
}

@end
