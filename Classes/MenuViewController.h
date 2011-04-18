//
//  MenuViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 4/10/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteViewController.h"

@interface MenuViewController : UIViewController {
	id<NoteViewControllerDelegate> delegate;
}
@property (assign) id<NoteViewControllerDelegate> delegate;

-(IBAction)closeButtonPressed: (id)sender;
-(IBAction)rootChanged: (id)sender;

@end
