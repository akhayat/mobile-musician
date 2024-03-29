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
#define HALF_STEPS_IN_OCTAVE 12

/* 
 * Enum for note names.  Had to use S for sharp because # is
 * reserved for preprocesser declerations. The integer the enum 
 * represents is the number of halfsteps from C. 
 */
typedef enum note_name {C, BS=C, CS, Db=CS, D, DS, Eb=DS, 
	E, Fb=E, ES, F=ES, FS, Gb=FS, G, GS, Ab=GS, A, AS, Bb=AS, B, Cb=B} note_name;

//Notes are immutable

@interface Note : NSObject {
    @private int midiNumber;
	@private note_name name;
	@private int octave;
}
@property (readonly) int midiNumber;
@property (readonly) note_name name;
@property (readonly) int octave;

/* 
 * The designated initializer.  Notes have to be initialized
 * with a name (enum) and octave number
 */
-(id)initWithName:(note_name)name andOctave:(int)octave;
-(Note*)stepUp: (int)numberOfHalfSteps;
-(Note*)stepDown: (int)numberOfHalfSteps;
-(NSString*)nameAsString;

@end
