//
//  SVPageController.m
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVPageController.h"

@implementation SVPageController
@synthesize page = _page;
@synthesize view = _view;
@synthesize pageLabel = _pageLabel;
@synthesize label = _label;

-(void)viewDidLoad:(NSUInteger)page {
	[_view setFrame:CGRectMake(320*page, 0, 320, 424)];
	_pageLabel.text = [NSString stringWithFormat:@"Page %d", page, nil];
	_label.text = [NSString stringWithFormat:@"Loaded"];
}
-(void)viewDidUnload {
	
}

-(IBAction)tapped:(id)sender {
	_label.text = [NSString stringWithFormat:@"Tapped: %d", _count++, nil];
}
@end
