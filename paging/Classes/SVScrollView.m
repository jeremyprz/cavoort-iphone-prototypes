//
//  SVScrollView.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVScrollView.h"
#import "SVTouchView.h"
#import "SVRoundedRect.h"

@implementation SVScrollView

-(void)dealloc {
	[super dealloc];
}

- (BOOL)touchesShouldBegin:(NSSet*)touches withEvent:(UIEvent*)event inContentView:(UIView*)view {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	BOOL begin = [view isKindOfClass:[SVRoundedRect class]] || [super touchesShouldBegin:touches withEvent:event inContentView:view];
	if (LOG) {NSLog(@"%@ => %d", [view class], begin);}
	return begin;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	BOOL cancel = ![view isKindOfClass:[SVRoundedRect class]];
	if (LOG) {NSLog(@"%@ => %d", [view class], cancel);}
	return cancel;
}

@end
