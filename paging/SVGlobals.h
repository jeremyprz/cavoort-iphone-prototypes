//
//  SVGlobals.h
//
//  Created by Jeremy Przasnyski on 3/23/09.
//  Copyright 2009 Cavoort, LLC. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface SVGlobals : NSObject {
	BOOL loggingEnabled;
}
@property (nonatomic) BOOL loggingEnabled;
+(SVGlobals*)sharedInstance;
@end
