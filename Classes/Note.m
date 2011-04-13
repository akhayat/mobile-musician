//
//  Note.m
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Note.h"


static NSArray *notesWithSharps = nil;
static NSArray *notesWithFlats = nil;

@implementation Note

@synthesize pitch;
@synthesize name;
@synthesize octave;

-(id)initWithName:(note_name)note andOctave:(int)oct {
	if (self = [super init]) {
		self.name = note;
		self.octave = oct;
		notesWithSharps = [NSArray arrayWithObjects: @"C", @"C#", @"D", @"D#", 
						@"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", nil];
		notesWithFlats = [NSArray arrayWithObjects: @"C", @"Db", @"D", @"Eb", 
						  @"E", @"F", @"Gb", @"G", @"Ab", @"A", @"Bb", @"B", nil];
		
	}
	return self;
}
					

-(double)playMe {
	NSLog(@"note: %d", self.name);
	return self.pitch;
}


//TODO: Error Catching
-(Note*)stepUp: (int)numberOfHalfSteps {
	//increase octave if the note goes past G#
	int newOctave = self.octave + (self.name + numberOfHalfSteps) / HALF_STEPS_IN_OCTAVE;
	note_name newName = (self.name + numberOfHalfSteps) % HALF_STEPS_IN_OCTAVE;
	
	Note *newNote = [[Note alloc] initWithName:newName andOctave:newOctave];
	[newNote autorelease];
    return newNote;
}

//TODO
-(Note*)stepDown: (int)numberOfHalfSteps {
	return nil;
}

-(NSString*)nameAsString {
	return [notesWithSharps objectAtIndex:self.name];
}

- (void)dealloc {
    [super dealloc];
}

@end