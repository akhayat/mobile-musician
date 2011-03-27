//
//  NoteView.m
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteView.h"


@implementation NoteView

@synthesize notes;

- (id)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
		self.notes = [NSMutableArray array];
	}
    return self;
}
/*
- (void)drawRect:(CGRect)rect {
}
*/
- (void)dealloc {
    [super dealloc];
}

@end
