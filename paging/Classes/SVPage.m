//
//  SVPage.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVPage.h"
#import "SVPageController.h"

@interface NSArray (Type)
-(id)firstObjectWithClass:(Class)class;
@end
@implementation NSArray (DayPrivate)
-(id)firstObjectWithClass:(Class)class {
	for (NSObject* o in self) {
		if ([o isKindOfClass:class])  {
			return o;
		}
	}
	return nil;
}
@end

@implementation SVPage
@synthesize index = _index;
@synthesize controller = _controller;

-(id)init:(NSUInteger)index {
	self = [super init];
	_index = index;
	return self;
}

-(void)dealloc {
	[self unload];
	[super dealloc];
}

-(void)loadInto:(UIScrollView*)scroll {
	if (!_controller) {
		NSMutableDictionary* injections = [[[NSMutableDictionary alloc] init] autorelease];
		NSDictionary* proxied = [NSDictionary dictionaryWithObject:injections forKey:UINibProxiedObjectsKey];
		NSArray* wired = [[NSBundle mainBundle] loadNibNamed:@"Page" owner:self options:proxied];
		self.controller = (SVPageController*)[[wired firstObjectWithClass:[SVPageController class]] retain];
		[_controller viewDidLoad:_index];
		[scroll addSubview:(UIView*)[_controller view]];
		[scroll bringSubviewToFront:(UIView*)[_controller view]];
	}
}

-(void)unload {
	if (_controller) {
		[[_controller view] removeFromSuperview];
		[_controller viewDidUnload];
		self.controller = nil;
	}
}

@end
