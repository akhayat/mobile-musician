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
@end

@interface MenuViewController : UIViewController <MenuViewControllerDelegate> {
	@private id<NoteViewControllerDelegate> delegate;
    @private ChangeScaleViewController *changeScaleViewController;
}
@property (assign) id<NoteViewControllerDelegate> delegate;
@property (retain) ChangeScaleViewController *changeScaleViewController;

-(IBAction)closeButtonPressed: (id)sender;
-(IBAction)rootChanged: (id)sender;
-(IBAction)changeScale: (id) sender;

@end
