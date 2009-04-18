//
//  SVRootController.h
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
@class SVScrollView;
@class SVPage;

@interface SVRootController : UIViewController <UIScrollViewDelegate> {
	NSMutableArray* _pages;
	SVScrollView* _scroll;
	UIPageControl* _pageControl;
}
@property (nonatomic, assign) IBOutlet SVScrollView* scroll;
@property (nonatomic, assign) IBOutlet UIPageControl* pageControl;
-(SVPage*)pageAt:(NSUInteger)index;
@end
