//
//  SVTouchView.h
//  UIScrollViewEx
//
//  Created by Jeremy Przasnyski on 4/17/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SVTouchView : UIView {
	UILabel* _label;
	UIView* _target;
	
	BOOL _touched;
	NSUInteger _count;
}
@property (nonatomic, assign) IBOutlet UILabel* label;
@property (nonatomic, assign) IBOutlet UIView* target;
-(BOOL)isAcceptingTouches;
@end
