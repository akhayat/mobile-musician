//
//  MobileMusicianViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundBankPlayer.h"
#import "Note.h"
#import "NoteView.h"
#import "Scale.h"
#import "Recorder.h"

@class MenuViewController;

@protocol NoteViewControllerDelegate
    @property (retain) Note *root;
    @property (retain) Scale *currentScale;
    @property (retain) NSString *newInstrument;
    @property BOOL displayNames; 
    -(IBAction)menuButtonPressed: (id)sender;
@end

@interface NoteViewController : UIViewController <NoteViewControllerDelegate> {
    @private Note *root;
             Scale *currentScale;
             NSMutableArray *notes;
             NSMutableArray *noteButtons;
             SoundBankPlayer *player;
             MenuViewController *menuViewController;
             NSString *instrument;
             NSString *newInstrument;
             BOOL displayNames;
             BOOL recording;
             Recorder *recorder;
             NSDate *startTime;
}
@property (retain) Note *root;
@property (retain) Scale *currentScale;
@property (retain) NSMutableArray *notes;
@property (retain) NSMutableArray *noteButtons;
@property (retain, readonly) SoundBankPlayer *player;
@property (retain) MenuViewController *menuViewController;
@property (retain) NSString *instrument;
@property (retain) Recorder *recorder;
@property (retain) NSDate *startTime;
@property BOOL displayNames;
@property BOOL recording;

-(IBAction)notePressed: (id)sender;
-(IBAction)playPressed: (id)sender;
-(IBAction)recordPressed: (id)sender;
-(IBAction)menuButtonPressed: (id)sender;

@end
