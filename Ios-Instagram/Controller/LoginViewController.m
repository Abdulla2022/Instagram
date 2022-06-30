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

- (IBAction)loginUser:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Can not login"
                                                                           message:@"Invalid Username/Password"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
            }];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"HomeFeed" bundle:nil];
        UITabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        self.view.window.rootViewController = tabBarController;
        
    }];
}

- (IBAction)registerUser:(id)sender {
    PFUser *newUser = [PFUser user];
    
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            return;
        }
        NSLog(@"User registered successfully");
        [self performSegueWithIdentifier:@"homeSegue" sender:nil];
    }];
}

@end
