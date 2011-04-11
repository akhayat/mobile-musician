//
//  NoteView.h
//  MobileMusician
//
//  Created by Anthony Khayat on 3/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BUTTON_SIDE 42
#define BUTTONS_PER_ROW 6
#define BUTTONS_PER_COLUMN 8

@interface NoteView : UIView {
    @private NSArray *notes;
}
@property (retain) NSArray *notes;

@end
