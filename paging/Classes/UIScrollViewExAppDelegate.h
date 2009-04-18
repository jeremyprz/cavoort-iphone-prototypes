//
//  UIScrollViewExAppDelegate.h
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright Cavoort, LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SVRootController;

@interface UIScrollViewExAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	SVRootController* viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SVRootController *viewController;

@end

