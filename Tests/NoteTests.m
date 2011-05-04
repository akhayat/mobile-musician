//
//  NoteTests.m
//  MobileMusician
//
//  Created by Anthony Khayat on 5/4/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "NoteTests.h"


@implementation NoteTests

// all code under test must be linked into the Unit Test bundle

- (void) setUp {
    testNote = [[Note alloc] initWithName:D andOctave:5];
    STAssertNotNil(testNote, @"Could not create test note.");
}

- (void) tearDown {
    [testNote release];
}
                         
- (void) testStepUp {
    NSString *nameMessage = @"The note should have been %d, but was %d";
    NSString *octMessage = @"The octave should have been %d, but was %d";
    
    Note *stepped = [testNote stepUp: 5];
    
    STAssertEquals(G, stepped.name, nameMessage , G, stepped.name);
    STAssertEquals(5, stepped.octave, octMessage, 5, stepped.octave);
    
    stepped = [testNote stepUp: 10];
    
    STAssertEquals(C, stepped.name, nameMessage, C, stepped.name);
    STAssertEquals(6, stepped.octave, octMessage, 6, stepped.octave);
    
    stepped = [testNote stepUp: 25];
    
    STAssertEquals(Eb, stepped.name, nameMessage, Eb, stepped.name);
    STAssertEquals(7, stepped.octave, octMessage, 7, stepped.octave);
    
    stepped = [testNote stepUp: 0];
    
    STAssertEquals(D, stepped.name, nameMessage, D, stepped.name);
    STAssertEquals(5, stepped.octave, octMessage, 5, stepped.octave);
    
    STAssertThrows([testNote stepUp: -1], @"Negative value should throw an exception");
    
}

- (void) testNameAsString {
    NSString *stringMessage =  @"%@ Note name represented incorrectly as %@";
    
    Note *nextNote = [[[Note alloc] initWithName:A andOctave:1] autorelease];
    STAssertEquals([nextNote nameAsString], @"A",stringMessage, @"A", [nextNote nameAsString]);
    
    nextNote = [[[Note alloc] initWithName:Bb andOctave:1] autorelease];
    STAssertEquals([nextNote nameAsString], @"A#",stringMessage, @"A#", [nextNote nameAsString]);
    
    nextNote = [[[Note alloc] initWithName:ES andOctave:1] autorelease];
    STAssertEquals([nextNote nameAsString], @"F",stringMessage, @"F", [nextNote nameAsString]);
    
    nextNote = [[[Note alloc] initWithName:GS andOctave:1] autorelease];
    STAssertEquals([nextNote nameAsString], @"G#",stringMessage, @"G#", [nextNote nameAsString]);
}

-(void) negativeOctaveTest {
    STAssertThrows([[[Note alloc] initWithName:A andOctave:-1] autorelease], @"Shouldn't allow init with negative octave");
}

@end
