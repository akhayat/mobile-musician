//
//  Recorder.h
//  MobileMusician
//
//  Created by Anthony Khayat on 4/27/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SoundBankPlayer.h"


@interface Recorder : NSObject {
    @private NSMutableArray *recordedNotes;
             NSMutableArray *delay;
             SoundBankPlayer *bank;
             BOOL playing;
}
@property (readonly) NSMutableArray *recordedNotes;
@property (readonly) NSMutableArray *delay;
@property (readonly) SoundBankPlayer *bank;
@property (readonly) BOOL playing;

-(void) playSequenceWithSoundBank: (SoundBankPlayer *)bank;
-(void) recordNoteWithMidiNumber:(int)midiNumber andDelay:(NSTimeInterval)delayTime;
-(void) clearSequence;
-(void) readSequenceFromFile;
-(void) saveSequence;
-(double) totalRecordTime;

@end
