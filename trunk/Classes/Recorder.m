//
//  Recorder.m
//  MobileMusician
//
//  Created by Anthony Khayat on 4/27/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import "Recorder.h"

//Private methods
@interface Recorder ()
    -(void) playNoteWithDelay:(NSNumber *)noteToPlay;
@end

@implementation Recorder

@synthesize delay, recordedNotes, bank;

//The designated initializer
-(id) init {
    if (self = [super init]) {
        delay = [[NSMutableArray array] retain];
        recordedNotes = [[NSMutableArray array] retain];
    }
    return self;
}

// To record a sequence, we just keep track of the note played
// and the time since the last note was hit
-(void) recordNoteWithMidiNumber: (int) midiNumber andDelay: (NSTimeInterval) delayTime {
    [recordedNotes addObject: [NSNumber numberWithInt: midiNumber]];
    [delay addObject: [NSNumber numberWithDouble: delayTime]];
}

-(void) playSequenceWithSoundBank: (SoundBankPlayer *)soundBank {
    NSTimeInterval currentDelay = 0.0;
    bank = soundBank;
    for (int i = 0; i < [recordedNotes count]; i++) {
        currentDelay += [[delay objectAtIndex: i] doubleValue];
        [self performSelector: @selector(playNoteWithDelay:) withObject: [recordedNotes objectAtIndex: i] afterDelay: currentDelay];
    }
}

-(void) playNoteWithDelay: (NSNumber *)noteToPlay {
    [bank playNote: [noteToPlay intValue] gain:1.0f];
}

-(void) clearSequence {
    [delay release];
    [recordedNotes release];
    delay = [[NSMutableArray array] retain];
    recordedNotes = [[NSMutableArray array] retain];
}

-(void) dealloc {
    [recordedNotes release];
    [delay release];
    [super dealloc];
}

@end
