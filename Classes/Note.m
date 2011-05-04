//
//  Note.m
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Note.h"


static NSArray *notesAsStrings= nil;

@implementation Note

@synthesize midiNumber, name, octave;

-(id)initWithName:(note_name)note andOctave:(int)oct {
	if (self = [super init]) {
        if (oct < 0) {
            [NSException raise:@"Negative octave" format:@"The octave cannot be negative Argument: %d", oct];
        }
		name = note;
		octave = oct;
		notesAsStrings = [[NSArray arrayWithObjects: @"C", @"C#", @"D", @"D#", 
						@"E", @"F", @"F#", @"G", @"G#", @"A", @"A#", @"B", nil] retain];
		midiNumber = name + HALF_STEPS_IN_OCTAVE * octave;
	}
	return self;
}

//TODO: Error Catching
-(Note*)stepUp: (int)numberOfHalfSteps {
    if (numberOfHalfSteps < 0) {
        [NSException raise:@"Negative half steps" 
                    format:@"The number of half steps cannot be negative Argument: %d", numberOfHalfSteps];
    }
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
	return [notesAsStrings objectAtIndex:self.name];
}

- (void)dealloc {
    [super dealloc];
}

@end
