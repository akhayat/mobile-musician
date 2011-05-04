//
//  ChangeScaleViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 4/17/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"

@class CustomScaleViewController;

@interface ChangeScaleViewController : UIViewController {
    @private id<MenuViewControllerDelegate> delegate;
}
@property (assign) id<MenuViewControllerDelegate> delegate;


-(IBAction)cancelButtonPressed: (id)sender;
-(IBAction)majorScaleButton: (id) sender;
-(IBAction)naturalMinorScaleButton: (id) sender;
-(IBAction)harmonicMinorScaleButton: (id) sender;
-(IBAction)BluesScaleButton: (id) sender;
-(IBAction)majorPentatonicScaleButton: (id) sender;
-(IBAction)minorPentatonicScaleButton: (id) sender;
-(IBAction)chromaticScaleButton: (id) sender;
-(IBAction)wholeToneScaleButton: (id) sender;
-(IBAction)customScaleButton: (id) sender;

@end
