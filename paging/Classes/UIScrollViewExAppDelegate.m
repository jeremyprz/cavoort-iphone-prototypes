//
//  UIScrollViewExAppDelegate.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright Cavoort, LLC 2009. All rights reserved.
//
#import "UIScrollViewExAppDelegate.h"
#import "SVRootController.h"

@implementation UIScrollViewExAppDelegate

@synthesize window;
@synthesize viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
