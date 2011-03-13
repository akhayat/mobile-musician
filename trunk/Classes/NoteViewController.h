//
//  MobileMusicianViewController.h
//  MobileMusician
//
//  Created by Anthony Khayat on 2/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "Scale.h"

@interface NoteViewController : UIViewController {
	@private Note *note;
    @private Scale *currentScale;
}
@property (retain) Note *note;
@property (retain) Scale *scale;

-(IBAction)notePressed: (UIButton*) noteButton;

@end

