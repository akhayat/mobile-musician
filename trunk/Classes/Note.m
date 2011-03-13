//
//  Note.m
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Note.h"

@implementation Note

@synthesize pitch;
@synthesize name;
@synthesize octave;

-(id)initWithName:(note_name)note andOctave:(int)oct {
	if (self = [super init]) {
		self.name = note;
		self.octave = oct;
	}
	return self;	
}

-(double)playMe {
	NSLog(@"note: %d", self.name);
	return self.pitch;
}



//TODO: Error Catching
-(Note*)stepUp: (int)numberOfHalfSteps {
	int newOctave = self.octave + (self.name + numberOfHalfSteps) / HALF_STEPS_IN_OCTAVE;
	note_name newName = self.name + (numberOfHalfSteps % 12);
	Note *newNote = [[Note alloc] initWithName:newName andOctave:newOctave];
	[newNote autorelease];
    return newNote;
}

//TODO
-(Note*)stepDown: (int)numberOfHalfSteps {
	return nil;
}

@end
