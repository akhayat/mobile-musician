//
//  MenuViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 4/10/11.
//  Copyright 2011 LMU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MenuViewController : UIViewController {
	//Keeps track of whether the menu is visible or not
@private BOOL menuVisible;
}
@property BOOL menuVisible;

-(IBAction)closeButtonPressed: (id)sender;

@end