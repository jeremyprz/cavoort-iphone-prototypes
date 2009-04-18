//
//  SVPageController.h
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
@class SVPage;
@class SVTouchView;

@interface SVPageController : NSObject {
	SVPage* _page;
	SVTouchView* _view;
	UILabel* _pageLabel;
	UILabel* _label;
	
	NSUInteger _count;
}
@property (nonatomic, assign) IBOutlet SVPage* page;
@property (nonatomic, assign) IBOutlet SVTouchView* view;
@property (nonatomic, assign) IBOutlet UILabel* pageLabel;
@property (nonatomic, assign) IBOutlet UILabel* label;
-(void)viewDidLoad:(NSUInteger)page;
-(void)viewDidUnload;
-(IBAction)tapped:(id)sender;
@end
