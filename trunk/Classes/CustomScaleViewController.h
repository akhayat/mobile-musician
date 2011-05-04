//
//  CustomScaleViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 5/2/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeScaleViewController.h"

#define SCALE_BUTTON_SIDE 64
#define SCALE_BUTTONS_PER_ROW 3
#define SCALE_BUTTONS_PER_COLUMN 4
#define X_OFFSET 30
#define Y_OFFSET 28
#define PADDING 10
#define NUMBER_OF_SCALE_BUTTONS SCALE_BUTTONS_PER_ROW * SCALE_BUTTONS_PER_COLUMN
#define MIN_NOTES 4

@interface CustomScaleViewController : UIViewController {
    @private NSMutableArray *scaleButtons;
             id<MenuViewControllerDelegate> delegate;
             IBOutlet UILabel *instructions;
}
@property (retain) NSMutableArray *scaleButtons;
@property (retain) IBOutlet UILabel *instructions;
@property (assign) id<MenuViewControllerDelegate> delegate;

-(IBAction) cancelButtonPressed: (id)sender;
-(IBAction) scaleButtonPressed: (id) sender;
-(IBAction) donePressed: (id) sender;

@end
