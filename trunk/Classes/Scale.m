//
//  Scale.m
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scale.h"


//These are private methods for creating
//common scales
@interface Scale()

- (NSArray*)chromaticArray;
- (NSArray*)majorArray;
- (NSArray*)majorPentatonicArray;
- (NSArray*)naturalMinorArray;
- (NSArray*)harmonicMinorArray;
- (NSArray*)minorPentatonicArray;
- (NSArray*)bluesArray;
- (NSArray*)wholeToneArray;

@end

@implementation Scale

@synthesize halfSteps;

//TODO: Error handling
-(id)initWithArray:(NSArray *)halfStepArray {
	if (self = [super init]) {
		self.halfSteps = [NSArray arrayWithArray:halfStepArray];
	}
	return self;		
}

-(id)initWithChromaticScale {
    return [self initWithArray: [self chromaticArray]];	
}

-(id)initWithMajorScale {
    return [self initWithArray: [self majorArray]];	
}
			
-(id)initWithNaturalMinorScale {
    return [self initWithArray: [self naturalMinorArray]];
}

-(id)initWithHarmonicMinorScale {
    return [self initWithArray: [self harmonicMinorArray]];	
}

-(id)initWithMajorPentatonicScale {
    return [self initWithArray: [self majorPentatonicArray]];	
}

-(id)initWithMinorPentatonicScale {
    return [self initWithArray: [self minorPentatonicArray]];	
}

-(id)initWithBluesScale {
    return [self initWithArray: [self bluesArray]];	
}

-(id)initWithWholeToneScale {
    return [self initWithArray: [self wholeToneArray]];	
}



-(NSArray*)toArrayOfNotesFromRoot:(Note *)root {
	NSMutableArray *noteArray = [NSMutableArray array];
	Note *nextNote = [[Note alloc] initWithName:root.name andOctave:root.octave];
	[noteArray addObject:nextNote];
	
	for (NSNumber *step in self.halfSteps) {
		nextNote = [nextNote stepUp: [step intValue]];
		[noteArray addObject:nextNote];
	}
	return [NSArray arrayWithArray: noteArray];
}

- (void)dealloc {
	[halfSteps release];
    [super dealloc];
}


/*
 * The arrays for the predefined scales
 */
- (NSArray*)chromaticArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:1], 
			[NSNumber numberWithInt:1], nil];	
}

- (NSArray*)majorArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:1], nil];	
}

- (NSArray*)naturalMinorArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:2], nil];
}

- (NSArray*)harmonicMinorArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:1],
			[NSNumber numberWithInt:3], [NSNumber numberWithInt:1], nil];
}

- (NSArray*)majorPentatonicArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:3],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:3], nil];
}

- (NSArray*)minorPentatonicArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:1], [NSNumber numberWithInt:4],
            [NSNumber numberWithInt:1], [NSNumber numberWithInt:4], nil];
}

- (NSArray*)bluesArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:3],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:1],
            [NSNumber numberWithInt:1], [NSNumber numberWithInt:3],
			[NSNumber numberWithInt:2], nil];
}

- (NSArray*)wholeToneArray {
	return [NSArray arrayWithObjects: [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], [NSNumber numberWithInt:2],
            [NSNumber numberWithInt:2], [NSNumber numberWithInt:2],
			[NSNumber numberWithInt:2], nil];
}

@end
