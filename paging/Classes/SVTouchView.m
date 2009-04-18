//
//  SVTouchView.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVTouchView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SVTouchView
@synthesize label = _label;
@synthesize target = _target;

-(BOOL)isAcceptingTouches {
	return _touched;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	
	UITouch *touch = [touches anyObject];
	CGPoint location = [touch locationInView:self];
	CALayer* layer = [[self layer] hitTest:location];
	_touched = layer && [layer delegate] == _target;
	if (![self isAcceptingTouches]) {
		[super touchesBegan:touches withEvent:event]; 
		return;
	}
	_label.text = [NSString stringWithFormat:@"Touches(B): %d", _count++, nil];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (![self isAcceptingTouches]) { [super touchesMoved:touches withEvent:event]; return; }
	_label.text = [NSString stringWithFormat:@"Touches(M): %d", _count++, nil];
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (![self isAcceptingTouches]) { [super touchesEnded:touches withEvent:event]; return; }
	_label.text = [NSString stringWithFormat:@"Touches(E): %d", _count++, nil];
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	_touched = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	if (![self isAcceptingTouches]) { [super touchesCancelled:touches withEvent:event]; return; }
	_label.text = [NSString stringWithFormat:@"Touches(C): %d", _count++, nil];
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
		_touched = NO;
}

@end
