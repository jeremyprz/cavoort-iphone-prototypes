//
//  SVGlobals.m
//
//  Created by Jeremy Przasnyski on 3/23/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import "SVGlobals.h"

static SVGlobals* gSharedInstance;

@implementation SVGlobals
@synthesize loggingEnabled;

-(id)init 
{
	self = [super init];
	self.loggingEnabled = YES;
	return self;
}

-(void)dealloc {
	[super dealloc];
}

+(SVGlobals*)sharedInstance {
	if (!gSharedInstance) {
		gSharedInstance = [[SVGlobals alloc] init];
	}
	return gSharedInstance;
}

@end
