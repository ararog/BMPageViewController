//
//  AppDelegate.m
//  BMPageViewController
//
//  Created by Rogério Pereira Araújo on 17/09/14.
//  Copyright (c) 2014 Rogério Pereira Araújo. All rights reserved.
//

#import "AppDelegate.h"
#import "BMPageViewControllerExample.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main"
                                                                bundle:nil] instantiateInitialViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
