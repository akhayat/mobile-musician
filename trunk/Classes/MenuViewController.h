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
@class CustomScaleViewController;

@protocol MenuViewControllerDelegate
    @property (assign) id<NoteViewControllerDelegate> delegate;
    @property (retain) IBOutlet UILabel *scaleLabel;
    @property (retain) CustomScaleViewController *customScaleViewController;
@end

@interface MenuViewController : UIViewController <MenuViewControllerDelegate> {
    @private id<NoteViewControllerDelegate> delegate;
             ChangeScaleViewController *changeScaleViewController;
             CustomScaleViewController *customScaleViewController;
             IBOutlet UILabel *scaleLabel;    
}
@property (assign) id<NoteViewControllerDelegate> delegate;
@property (retain) ChangeScaleViewController *changeScaleViewController;
@property (retain) IBOutlet UILabel *scaleLabel;
@property (retain) CustomScaleViewController *customScaleViewController;

-(IBAction)closeButtonPressed: (id)sender;
-(IBAction)rootChanged: (id)sender;
-(IBAction)changeScale: (id) sender;
-(IBAction)toggleDisplay: (id) sender;
-(IBAction)changeInstrument: (id) sender;
-(IBAction)randomizePressed: (id) sender;

@end
