//
//  TTVNewItemViewController.m
//  TaskTableView
//
//  Created by Pavel Ostanin on 26/08/2015.
//  Copyright (c) 2015 Pavel Ostanin. All rights reserved.
//

#import "TTVNewItemViewController.h"
#import "TTVValidator.h"
#import "TTVUserFabric.h"
#import "TTVDataSource.h"

@interface TTVNewItemViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;

@end

@implementation TTVNewItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveItem:(id)sender {
    TTVValidator *validator = [[TTVValidator alloc] init];
    TTVDataSource *dataSource = [[TTVDataSource alloc] init];
    NSError *error = nil;
    if ([validator validateString:self.userNameTextField.text error:&error]) {
        [dataSource saveUser:[TTVUserFabric creatUserWhithName:self.userNameTextField.text]];
        [self performSegueWithIdentifier:@"unwindToContainerController" sender:self];
    }
    else {
        [[[UIAlertView alloc] initWithTitle:error.localizedDescription
                                    message:error.localizedRecoverySuggestion
                                   delegate:nil
                          cancelButtonTitle:NSLocalizedString(@"OK", nil)
                          otherButtonTitles:nil, nil] show];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.userNameTextField resignFirstResponder];
    return YES;
}

@end
