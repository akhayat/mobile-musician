//
//  MenuViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 4/10/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteViewController.h"

@class ChangeScaleViewController;

@protocol MenuViewControllerDelegate
    @property (assign) id<NoteViewControllerDelegate> delegate;
    @property (retain) IBOutlet UILabel *scaleLabel;
@end

@interface MenuViewController : UIViewController <MenuViewControllerDelegate> {
	@private id<NoteViewControllerDelegate> delegate;
    @private ChangeScaleViewController *changeScaleViewController;
    @private IBOutlet UILabel *scaleLabel;
}
@property (assign) id<NoteViewControllerDelegate> delegate;
@property (retain) ChangeScaleViewController *changeScaleViewController;
@property (retain) IBOutlet UILabel *scaleLabel;

-(IBAction)closeButtonPressed: (id)sender;
-(IBAction)rootChanged: (id)sender;
-(IBAction)changeScale: (id) sender;
-(IBAction)toggleDisplay: (id) sender;
-(IBAction)changeInstrument: (id) sender;

@end
