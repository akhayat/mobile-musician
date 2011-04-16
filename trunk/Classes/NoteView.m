//
//  NoteView.m
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteView.h"


@implementation NoteView

/*@synthesize noteButtons;

- (id)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]) {
		noteButtons = [NSMutableArray array];
	}
    return self;
}
*/
/*
 * Adds the note buttons to the view
- (void)drawRect:(CGRect)rect {
	for (UIButton* button in self.noteButtons) {
		[self addSubview:button];
	}
}
*/

- (void)dealloc {
	//[noteButtons release];
    [super dealloc];
}

@end
