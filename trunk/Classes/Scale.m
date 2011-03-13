//
//  Scale.m
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Scale.h"


@implementation Scale

@synthesize halfSteps;

//TODO: Error handling
-(id)initWithArray:(NSArray *)halfStepArray {
	if (self = [super init]) {
		self.halfSteps = [NSArray arrayWithArray:halfStepArray];
	}
	return self;		
}

-(NSArray*)toArrayOfNotesFromRoot:(Note *)root {
	NSMutableArray *noteArray = [NSMutableArray array];
	Note *nextNote = [[Note alloc] initWithName:root.name andOctave:root.octave];
	[noteArray addObject:nextNote];
	
	for (NSNumber *step in self.halfSteps) {
		nextNote = [nextNote stepUp: [step intValue]];
		[noteArray addObject:nextNote];
	}
	return noteArray;
}

@end
