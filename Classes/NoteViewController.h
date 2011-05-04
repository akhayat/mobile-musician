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
#import "Scale.h"
#import "Recorder.h"

#define MAX_RECORD_TIME 15.0
#define BUTTON_SIDE 60
#define BUTTONS_PER_ROW 5
#define BUTTONS_PER_COLUMN 6
#define NUMBER_OF_BUTTONS BUTTONS_PER_ROW * BUTTONS_PER_COLUMN

@class MenuViewController;

@protocol NoteViewControllerDelegate
    @property (retain) Note *root;
    @property (retain) Scale *currentScale;
    @property (retain) NSString *newInstrument;
    @property BOOL displayNames; 
    @property BOOL randomized;
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
             BOOL randomized;
             IBOutlet UIBarButtonItem *recordButton;
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
@property (retain) IBOutlet UIBarButtonItem *recordButton;
@property BOOL displayNames;
@property BOOL recording;
@property BOOL randomized;



-(IBAction)notePressed: (id)sender;
-(IBAction)playPressed: (id)sender;
-(IBAction)recordPressed: (id)sender;
-(IBAction)menuButtonPressed: (id)sender;
-(void)toggleRecord;

@end
