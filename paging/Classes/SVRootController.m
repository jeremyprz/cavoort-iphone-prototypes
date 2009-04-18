//
//  SVRootController.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVRootController.h"
#import "SVPage.h"
#import "SVScrollView.h"
#import "SVPageController.h"

@interface SVRootController (private)
-(BOOL)shouldLoad:(NSUInteger)index;
@end

@implementation SVRootController
@synthesize scroll = _scroll;
@synthesize pageControl = _pageControl;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {}
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)viewDidLoad {
	_pages = [[NSMutableArray alloc] initWithCapacity:10];
	for (NSUInteger i = 0; i < 10; i++) {
		[_pages addObject:[[[SVPage alloc] init:i] autorelease]];
	}
	[_scroll setContentSize:CGSizeMake(10*320,424)];
	[_pageControl setNumberOfPages:[_pages count]];
	[[self pageAt:0] loadInto:_scroll];
	[[self pageAt:1] loadInto:_scroll];
    [super viewDidLoad];
}

-(SVPage*)pageAt:(NSUInteger)index {
	return [_pages objectAtIndex:index];
}

-(BOOL)shouldLoad:(NSUInteger)index {
	return abs([_pageControl currentPage] - index) <= 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload { }

// any offset changes
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}      

// called on finger up if user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	[_scroll setUserInteractionEnabled:NO];
}

// called on finger up as we are moving
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}
// called when scroll view grinds to a halt
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	NSUInteger index = [scrollView contentOffset].x / 320;
	[_pageControl setCurrentPage:index];
	for (NSUInteger i = 0; i < [_pages count]; i++) {
		SVPage* page = [self pageAt:i];
		[self shouldLoad:i] ? [page loadInto:scrollView] : [page unload];
	}
	[_scroll setUserInteractionEnabled:YES];
}

// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}

// return a view that will be scaled. if delegate returns nil, nothing happens
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	return nil;
}

// scale between minimum and maximum. called after any 'bounce' animations
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}
// return a yes if you want to scroll to the top. if not defined, assumes YES
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
	return YES;
}

// called when scrolling animation finished. may be called immediately if already at top
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
	if (LOG) {NSLog(@"%s",__FUNCTION__);}
}

@end
