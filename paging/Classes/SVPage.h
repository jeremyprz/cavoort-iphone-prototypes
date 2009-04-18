//
//  SVPage.h
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
@class SVPageController;

@interface SVPage : NSObject {
	NSUInteger _index;
	SVPageController* _controller;
}
@property (nonatomic) NSUInteger index;
@property (nonatomic, retain) IBOutlet SVPageController* controller;
-(id)init:(NSUInteger)index;
-(void)loadInto:(UIScrollView*)scroll;
-(void)unload;
@end
