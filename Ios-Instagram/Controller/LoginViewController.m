//
//  LoginViewController.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "LoginViewController.h"
#import "Parse/Parse.h"
#import "ComposeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)loginUser:(id)sender {
    [self userLogin];
}

- (void)userLogin {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"homeSegue" sender:nil];
        }
    }];
}

- (IBAction)registerUser:(id)sender {
    [self userRegister];
}

- (void)userRegister {
    PFUser *newUser = [PFUser user];

    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;

    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");

           // [self dismissViewControllerAnimated:YES completion:nil];
            [self performSegueWithIdentifier:@"homeSegue" sender:nil];
        }
    }];

}

@end
