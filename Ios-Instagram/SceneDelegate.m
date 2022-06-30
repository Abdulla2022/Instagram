//
//  SceneDelegate.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "SceneDelegate.h"
#import "Parse/Parse.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    if (PFUser.currentUser) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
    }

}

@end
