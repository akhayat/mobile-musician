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
    -(void) donePlaying;
@end

@implementation Recorder

@synthesize delay, recordedNotes, bank, playing;

//The designated initializer
-(id) init {
    if (self = [super init]) {
        [self readSequenceFromFile];
        if (recordedNotes == nil) recordedNotes = [[NSMutableArray array] retain];
        if (delay == nil ) delay = [[NSMutableArray array] retain];
        playing = NO;
    }
    return self;
}

// To record a sequence, we just keep track of the note played
// and the time since the last note was hit
// It stores values as strings so it can be read as a plist later.
-(void) recordNoteWithMidiNumber: (int) midiNumber andDelay: (NSTimeInterval) delayTime {
    [recordedNotes addObject: [NSString stringWithFormat:@"%d", midiNumber]];
    [delay addObject: [NSString stringWithFormat:@"%f", delayTime]];
}

-(void) playSequenceWithSoundBank: (SoundBankPlayer *)soundBank {
    playing = YES;
    NSTimeInterval currentDelay = 0.0;
    bank = soundBank;
    for (int i = 0; i < [recordedNotes count]; i++) {
        if(i != 0) currentDelay += [[delay objectAtIndex: i] doubleValue];
        [self performSelector: @selector(playNoteWithDelay:) withObject: [recordedNotes objectAtIndex: i] afterDelay: currentDelay];
    }
    [self performSelector: @selector(donePlaying) withObject: nil afterDelay: currentDelay];
}

-(void)donePlaying {
    playing = NO;
}

// Calculates the total record time
// NOT including the first since the time between
// notes 0 and 1 is skipped anyway
-(double)totalRecordTime {
    double sum = 0.0;
    for (NSString *time in delay) {
        sum += [time doubleValue] - [[delay objectAtIndex:0] doubleValue];
    }
    return sum;
}

// The call to performselector:withobject:afterdelay:
// Only works for methods with one parameter
// So I made this wrapper around the banks play method
-(void) playNoteWithDelay: (NSNumber *)noteToPlay {
    [bank playNote: [noteToPlay intValue] gain:1.0f];
}

// Clears the currently recorded sequence
-(void) clearSequence {
    [delay release];
    [recordedNotes release];
    delay = [[NSMutableArray array] retain];
    recordedNotes = [[NSMutableArray array] retain];
}

// Save the contents of the delay and notes to a plist
-(void)saveSequence {
    NSString* docFolder = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    [delay writeToFile:[docFolder stringByAppendingPathComponent: @"mm_sequence_delay.plist"] atomically: YES];
    [recordedNotes writeToFile: [docFolder stringByAppendingPathComponent: @"mm_sequence_notes.plist"] atomically: YES];

}

-(void)readSequenceFromFile {
    NSString* docFolder = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    delay = [[NSArray arrayWithContentsOfFile: [docFolder stringByAppendingPathComponent: @"mm_sequence_delay.plist"]] retain];
    recordedNotes = [[NSArray arrayWithContentsOfFile:[docFolder stringByAppendingPathComponent: @"mm_sequence_notes.plist"]] retain];
}

-(void) dealloc {
    [recordedNotes release];
    [delay release];
    [super dealloc];
}

@end
