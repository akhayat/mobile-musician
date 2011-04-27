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
    @private Scale *currentScale;
    @private NSMutableArray *notes;
    @private NSMutableArray *noteButtons;
    @private SoundBankPlayer *player;
    @private MenuViewController *menuViewController;
    @private NSString *instrument;
    @private NSString *newInstrument;
    @private BOOL displayNames;
}
@property (retain) Note *root;
@property (retain) Scale *currentScale;
@property (retain) NSMutableArray *notes;
@property (retain) NSMutableArray *noteButtons;
@property (retain, readonly) SoundBankPlayer *player;
@property (retain) MenuViewController *menuViewController;
@property BOOL displayNames;
@property (retain) NSString *instrument;

-(IBAction)notePressed: (id)sender;
-(IBAction)menuButtonPressed: (id)sender;

@end

