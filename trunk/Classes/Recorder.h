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
}
@property (readonly) NSMutableArray *recordedNotes;
@property (readonly) NSMutableArray *delay;
@property (readonly) SoundBankPlayer *bank;

-(void) playSequenceWithSoundBank: (SoundBankPlayer *)bank;
-(void) recordNoteWithMidiNumber:(int)midiNumber andDelay:(NSTimeInterval)delayTime;
-(void) clearSequence;

@end
