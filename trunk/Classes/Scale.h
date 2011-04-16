//
//  Scale.h
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"


@interface Scale : NSObject {

	//An array of half steps required to create the scale
@private NSArray* halfSteps;
	
}
@property (retain) NSArray *halfSteps;
/*
 * Creates a scale from the given list of half steps
 * For example, [2, 2, 1, 2, 2, 2, 1] is the major scale---
 * whole step, whole step, half step, whole, whole, whole, half.
 * This is the designated initializer.
 */
-(id)initWithArray: (NSArray *)halfStepArray;

-(id)initWithChromaticScale;
-(id)initWithMajorScale;
-(id)initWithNaturalMinorScale;
-(id)initWithHarmonicMinorScale;
-(id)initWithMajorPentatonicScale;
-(id)initWithMinorPentatonicScale;
-(id)initWithBluesScale;
-(id)initWithWholeToneScale;


/*
 * Given a root, in returns an array of notes in the scale
 */
-(NSArray*)toArrayOfNotesFromRoot: (Note *)root;

@end
