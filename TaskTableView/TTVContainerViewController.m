//
//  TTVContainerViewController.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 25/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVContainerViewController.h"
#import "TTVUsersCollectionViewController.h"
#import "TTVUsersTableViewController.h"


@interface TTVContainerViewController ()

@property TTVUsersCollectionViewController *collectionViewController;
@property TTVUsersTableViewController *tableViewController;

- (IBAction)changeController:(id)sender;

@end

@implementation TTVContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"COLLECTION_CONTROLLER"];
    self.tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TABLE_CONTROLLER"];
    [self addChildViewController:self.tableViewController];
    self.tableViewController.view.frame = self.view.frame;
    [self.view addSubview:self.tableViewController.view];
    [self.tableViewController didMoveToParentViewController:self];
    self.navigationItem.leftBarButtonItem.title = @"Collection View";
}

- (void) cycleFromViewController: (UIViewController*) fromController
                toViewController: (UIViewController*) toController {
    [fromController willMoveToParentViewController:nil];
    [self addChildViewController:toController];
    toController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 0);
    CGRect endFrame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 0);
    
    [self transitionFromViewController: fromController toViewController: toController
                              duration: 0.25
                               options:0
                            animations:^{
                                toController.view.frame = fromController.view.frame;
                                fromController.view.frame = endFrame;
                                self.navigationItem.leftBarButtonItem.enabled = NO;
                            }
                            completion:^(BOOL finished) {
                                [fromController removeFromParentViewController];
                                [toController didMoveToParentViewController:self];
                                self.navigationItem.leftBarButtonItem.enabled = YES;
                            }];
}

#pragma mark - change controller action

- (IBAction)changeController:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%@",[self.childViewControllers[0] class]];
    if ([str isEqualToString:@"TTVUsersTableViewController"]) {
        self.navigationItem.leftBarButtonItem.title = @"Table View";
        [self cycleFromViewController:self.tableViewController
                     toViewController:self.collectionViewController];
    }
    else {
        self.navigationItem.leftBarButtonItem.title = @"Collection View";
        [self cycleFromViewController:self.collectionViewController
                     toViewController:self.tableViewController];
    }
}

#pragma mark - unwind action

- (IBAction)unwindToContainerController:(UIStoryboardSegue*)sender {
}

@end
