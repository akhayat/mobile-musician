//
//  Note.h
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MAX_OCTAVES 8
#define A4 440
#define HALF_STEPS_IN_OCTAVE 12;

/* 
 * Enum for note names.  Had to use s for sharp because # is
 * reserved for preprocesser declerations.  
 */
typedef enum note_name {A, As, Bb=As, B, Cb=B, C, Bs=C, Cs, Db=Cs, 
	D, Ds, Eb=Ds, E, Fb=E, F, Es=F, Fs, Gb=Fs, G, Gs, Ab=Gs} note_name;

@interface Note : NSObject {
    @private double pitch;
	@private note_name name;
	@private int octave;
}
@property (readonly) double pitch;
@property note_name name;
@property int octave;

/* 
 * The designated initializer.  Notes have to be initialized
 * with a name (enum) and octave number 
 */
-(id)initWithName:(note_name)name andOctave:(int)octave;
-(double)playMe;
-(Note*)stepUp: (int)numberOfHalfSteps;
-(Note*)stepDown: (int)numberOfHalfSteps; 

@end
