//
//  AppDelegate.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "AppDelegate.h"
#import "Parse/Parse.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ParseClientConfiguration *config = [ParseClientConfiguration  configurationWithBlock:^(id<ParseMutableClientConfiguration> configuration) {

        configuration.applicationId = @"VhLeD9KTrrTpNgktmuVYe6pdG5U8ITDaJ8SmxLYR";
        configuration.clientKey = @"wiSzI4pIEY07MSWQ2awhqif296yhCuFcTBFl95a4";
        configuration.server = @"https://parseapi.back4app.com";
    }];

    [Parse initializeWithConfiguration:config];
    return YES;
}

#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

@end
