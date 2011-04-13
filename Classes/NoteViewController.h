//
//  MobileMusicianViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundBankPlayer.h"
#import "NoteView.h"
#import "Note.h"
#import "Scale.h"

@interface NoteViewController : UIViewController {
	@private Note *root;
    @private Scale *currentScale;
	@private NSArray *notes;
	@private SoundBankPlayer *player;
}
@property (retain) Note *root;
@property (retain) Scale *scale;
@property (nonatomic, retain) NSArray *notes;
@property (retain, readonly) SoundBankPlayer *player;


-(IBAction)notePressed: (id)sender;
-(IBAction)menuButtonPressed: (id)sender;

@end

